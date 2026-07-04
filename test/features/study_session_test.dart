import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/vocabulary_app.dart';
import 'package:flutter_application_1/data/local/app_database.dart';
import 'package:flutter_application_1/data/repositories/card_repository.dart';
import 'package:flutter_application_1/data/repositories/deck_repository.dart';
import 'package:flutter_application_1/data/repositories/review_repository.dart';
import 'package:flutter_application_1/features/flashcard/controllers/study_session_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late CardRepository cardRepository;
  late ReviewRepository reviewRepository;
  late StudySessionController controller;
  late int cardId;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    final deckRepository = DeckRepository(database);
    cardRepository = CardRepository(database);
    reviewRepository = ReviewRepository(database);
    controller = StudySessionController(cardRepository);
    final deckId = await deckRepository.createDeck(name: 'Today');
    cardId = await cardRepository.createCard(
      deckId: deckId,
      english: 'consistency',
      vietnamese: 'sự nhất quán',
    );
  });

  tearDown(() async {
    controller.dispose();
    await database.close();
  });

  test('loads due cards and records study result', () async {
    await controller.loadToday();

    expect(controller.cards.single.id, cardId);
    expect(controller.currentCard?.english, 'consistency');

    await controller.answerCurrent(true);

    expect(controller.isCompleted, isTrue);
    expect(controller.correctAnswers, 1);
    final card = (await cardRepository.getAllCards()).single;
    expect(card.reviewCount, 1);
    expect(card.correctCount, 1);
    expect(await reviewRepository.getLogsByCardId(cardId), hasLength(1));

    await controller.loadToday();
    expect(controller.cards, isEmpty);
  });

  test('wrong answer remains due and creates review log', () async {
    await controller.loadToday();
    await controller.answerCurrent(false);
    await controller.loadToday();

    expect(controller.cards.single.id, cardId);
    final card = (await cardRepository.getAllCards()).single;
    expect(card.wrongCount, 1);
    expect(await reviewRepository.getLogsByCardId(cardId), hasLength(1));
  });

  testWidgets('Study Today renders cards loaded from database', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: StudyTodayScreen(controller: controller)),
    );
    await tester.pumpAndSettle();

    expect(find.text('consistency'), findsOneWidget);
    expect(find.text('sự nhất quán'), findsOneWidget);
    expect(find.text('Bạn có 1 từ cần ôn để giữ tiến độ.'), findsOneWidget);
    expect(
      tester
          .widget<FilledButton>(
            find.widgetWithText(FilledButton, 'Bắt đầu học'),
          )
          .onPressed,
      isNotNull,
    );

    await tester.tap(find.text('Bắt đầu học'));
    await tester.pumpAndSettle();

    expect(find.byType(FlashcardStudyScreen), findsOneWidget);
    expect(find.text('Nhấn để xem nghĩa'), findsOneWidget);
  });
}
