import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/data/local/app_database.dart';
import 'package:flutter_application_1/data/repositories/card_repository.dart';
import 'package:flutter_application_1/data/repositories/deck_repository.dart';
import 'package:flutter_application_1/data/repositories/review_repository.dart';

void main() {
  late AppDatabase database;
  late DeckRepository deckRepository;
  late CardRepository cardRepository;
  late ReviewRepository reviewRepository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    deckRepository = DeckRepository(database);
    cardRepository = CardRepository(database);
    reviewRepository = ReviewRepository(database);
  });

  tearDown(() => database.close());

  test('creates an offline deck and due card', () async {
    final deckId = await deckRepository.createDeck(name: 'Cooking');
    await cardRepository.createCard(
      deckId: deckId,
      english: 'chop',
      vietnamese: 'băm nhỏ',
    );

    final cards = await cardRepository.getCardsByDeckId(deckId);
    final dueCards = await cardRepository.getDueCards(DateTime.now());

    expect(cards, hasLength(1));
    expect(cards.single.status, learningStatus);
    expect(cards.single.reviewCount, 0);
    expect(dueCards.single.id, cards.single.id);
  });

  test('updates progress and records every review atomically', () async {
    final deckId = await deckRepository.createDeck(name: 'Daily words');
    final cardId = await cardRepository.createCard(
      deckId: deckId,
      english: 'consistent',
      vietnamese: 'kiên định',
    );

    await cardRepository.updateCardProgress(
      cardId: cardId,
      isCorrect: false,
      answerType: 'typing',
    );
    for (var review = 0; review < 5; review++) {
      await cardRepository.updateCardProgress(
        cardId: cardId,
        isCorrect: true,
        answerType: 'manual',
      );
    }

    final card = (await cardRepository.getCardsByDeckId(deckId)).single;
    final logs = await reviewRepository.getLogsByCardId(cardId);

    expect(card.reviewCount, 5);
    expect(card.correctCount, 5);
    expect(card.wrongCount, 1);
    expect(card.status, masteredStatus);
    expect(logs, hasLength(6));
  });

  test('deleting a deck cascades to cards and review logs', () async {
    final deckId = await deckRepository.createDeck(name: 'Temporary');
    final cardId = await cardRepository.createCard(
      deckId: deckId,
      english: 'temporary',
      vietnamese: 'tạm thời',
    );
    await cardRepository.updateCardProgress(
      cardId: cardId,
      isCorrect: true,
      answerType: 'multiple_choice',
    );

    await deckRepository.deleteDeck(deckId);

    expect(await cardRepository.getCardsByDeckId(deckId), isEmpty);
    expect(await reviewRepository.getLogsByCardId(cardId), isEmpty);
  });

  test('creates many cards in one transaction', () async {
    final cards = List.generate(
      50,
      (index) => NewCardRecord(
        english: 'word $index',
        vietnamese: 'nghĩa $index',
      ),
    );

    final deckId = await deckRepository.createDeckWithCards(
      name: 'Bulk deck',
      cards: cards,
    );

    expect(await cardRepository.getCardsByDeckId(deckId), hasLength(50));
  });

  test('rolls back deck when bulk card insert fails', () async {
    await expectLater(
      deckRepository.createDeckWithCards(
        name: 'Invalid deck',
        cards: const [
          NewCardRecord(english: 'duplicate', vietnamese: 'một'),
          NewCardRecord(english: 'duplicate', vietnamese: 'hai'),
        ],
      ),
      throwsA(anything),
    );

    expect(await deckRepository.getAllDecks(), isEmpty);
    expect(await cardRepository.getAllCards(), isEmpty);
  });
}
