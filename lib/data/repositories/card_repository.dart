import 'package:drift/drift.dart';

import '../../core/constants/review_intervals.dart';
import '../../core/utils/date_utils.dart';
import '../local/app_database.dart';

const learningStatus = 'learning';
const masteredStatus = 'mastered';
const archivedStatus = 'archived';
const supportedAnswerTypes = {'multiple_choice', 'typing', 'manual'};

class CardRepository {
  CardRepository(this._database);

  final AppDatabase _database;

  Future<int> createCard({
    required int deckId,
    required String english,
    required String vietnamese,
    String? audioPath,
  }) {
    final now = DateTime.now();
    return _database.into(_database.cards).insert(
          CardsCompanion.insert(
            deckId: deckId,
            english: english.trim(),
            vietnamese: vietnamese.trim(),
            audioPath: Value(_nullIfBlank(audioPath)),
            nextReviewDate: startOfDay(now),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<List<Card>> getCardsByDeckId(int deckId) {
    final query = _database.select(_database.cards)
      ..where((card) => card.deckId.equals(deckId))
      ..orderBy([(card) => OrderingTerm.asc(card.createdAt)]);
    return query.get();
  }

  Future<List<Card>> getDueCards(DateTime date) {
    final query = _database.select(_database.cards)
      ..where(
        (card) =>
            card.status.equals(learningStatus) &
            card.nextReviewDate.isSmallerOrEqualValue(endOfDay(date)),
      )
      ..orderBy([(card) => OrderingTerm.asc(card.nextReviewDate)]);
    return query.get();
  }

  Future<List<Card>> getLearningCards() => _getCardsByStatus(learningStatus);

  Future<List<Card>> getMasteredCards() => _getCardsByStatus(masteredStatus);

  Future<void> updateCardProgress({
    required int cardId,
    required bool isCorrect,
    required String answerType,
  }) async {
    if (!supportedAnswerTypes.contains(answerType)) {
      throw ArgumentError.value(answerType, 'answerType');
    }

    await _database.transaction(() async {
      final cardQuery = _database.select(_database.cards)
        ..where((card) => card.id.equals(cardId));
      final card = await cardQuery.getSingle();
      final now = DateTime.now();
      final nextReviewCount =
          isCorrect ? card.reviewCount + 1 : card.reviewCount;
      final nextStatus = isCorrect &&
              nextReviewCount >= reviewIntervals.length
          ? masteredStatus
          : learningStatus;
      final nextReviewDate = isCorrect
          ? startOfDay(now).add(
              Duration(days: getNextReviewInterval(nextReviewCount)),
            )
          : startOfDay(now);

      await (_database.update(_database.cards)
            ..where((row) => row.id.equals(cardId)))
          .write(
        CardsCompanion(
          reviewCount: Value(nextReviewCount),
          correctCount: Value(
            isCorrect ? card.correctCount + 1 : card.correctCount,
          ),
          wrongCount: Value(
            isCorrect ? card.wrongCount : card.wrongCount + 1,
          ),
          status: Value(nextStatus),
          nextReviewDate: Value(nextReviewDate),
          updatedAt: Value(now),
        ),
      );

      await _database.into(_database.reviewLogs).insert(
            ReviewLogsCompanion.insert(
              cardId: cardId,
              isCorrect: isCorrect,
              answerType: answerType,
              reviewedAt: now,
            ),
          );
    });
  }

  Future<void> updateCardContent({
    required int cardId,
    required String english,
    required String vietnamese,
    String? audioPath,
  }) async {
    await (_database.update(_database.cards)
          ..where((card) => card.id.equals(cardId)))
        .write(
      CardsCompanion(
        english: Value(english.trim()),
        vietnamese: Value(vietnamese.trim()),
        audioPath: Value(_nullIfBlank(audioPath)),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> archiveCard(int cardId) async {
    await (_database.update(_database.cards)
          ..where((card) => card.id.equals(cardId)))
        .write(
      CardsCompanion(
        status: const Value(archivedStatus),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteCard(int cardId) async {
    await (_database.delete(_database.cards)
          ..where((card) => card.id.equals(cardId)))
        .go();
  }

  Future<List<Card>> _getCardsByStatus(String status) {
    final query = _database.select(_database.cards)
      ..where((card) => card.status.equals(status))
      ..orderBy([(card) => OrderingTerm.desc(card.updatedAt)]);
    return query.get();
  }
}

String? _nullIfBlank(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
