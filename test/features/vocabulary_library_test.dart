import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/vocabulary_app.dart';
import 'package:flutter_application_1/data/local/app_database.dart';
import 'package:flutter_application_1/data/repositories/card_repository.dart';
import 'package:flutter_application_1/data/repositories/deck_repository.dart';
import 'package:flutter_application_1/features/flashcard/controllers/vocabulary_library_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late CardRepository cardRepository;
  late VocabularyLibraryController controller;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    final deckRepository = DeckRepository(database);
    cardRepository = CardRepository(database);
    controller = VocabularyLibraryController(cardRepository);

    final deckId = await deckRepository.createDeck(name: 'Saved vocabulary');
    await cardRepository.createCard(
      deckId: deckId,
      english: 'resilience',
      vietnamese: 'sự kiên cường',
    );
    final masteredCardId = await cardRepository.createCard(
      deckId: deckId,
      english: 'meticulous',
      vietnamese: 'tỉ mỉ',
    );
    for (var review = 0; review < 5; review++) {
      await cardRepository.updateCardProgress(
        cardId: masteredCardId,
        isCorrect: true,
        answerType: 'manual',
      );
    }
  });

  tearDown(() async {
    controller.dispose();
    await database.close();
  });

  test('loads, searches and filters cards from database', () async {
    await controller.loadCards();

    expect(controller.visibleCards, hasLength(2));
    controller.setSearchQuery('kiên');
    expect(controller.visibleCards.single.english, 'resilience');

    controller.setSearchQuery('');
    controller.setFilter(LibraryFilter.mastered);
    expect(controller.visibleCards.single.english, 'meticulous');
  });

  testWidgets('renders saved database cards in Vocabulary Library', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: VocabularyLibraryScreen(controller: controller)),
    );
    await tester.pumpAndSettle();

    expect(find.text('resilience'), findsOneWidget);
    expect(find.text('meticulous'), findsOneWidget);
    expect(find.text('sự kiên cường'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextField, 'Tìm từ hoặc nghĩa...'),
      'tỉ mỉ',
    );
    await tester.pump();

    expect(find.text('meticulous'), findsOneWidget);
    expect(find.text('resilience'), findsNothing);
  });
}
