import 'package:drift/drift.dart';

import '../../core/utils/date_utils.dart';
import '../local/app_database.dart';
import 'card_repository.dart';

class ReviewRepository {
  ReviewRepository(this._database);

  final AppDatabase _database;

  Future<void> addReviewLog({
    required int cardId,
    required bool isCorrect,
    required String answerType,
  }) async {
    if (!supportedAnswerTypes.contains(answerType)) {
      throw ArgumentError.value(answerType, 'answerType');
    }
    await _database.into(_database.reviewLogs).insert(
          ReviewLogsCompanion.insert(
            cardId: cardId,
            isCorrect: isCorrect,
            answerType: answerType,
            reviewedAt: DateTime.now(),
          ),
        );
  }

  Future<List<ReviewLog>> getLogsByCardId(int cardId) {
    final query = _database.select(_database.reviewLogs)
      ..where((log) => log.cardId.equals(cardId))
      ..orderBy([(log) => OrderingTerm.desc(log.reviewedAt)]);
    return query.get();
  }

  Future<List<ReviewLog>> getLogsByDate(DateTime date) {
    final query = _database.select(_database.reviewLogs)
      ..where(
        (log) => log.reviewedAt.isBetweenValues(
          startOfDay(date),
          endOfDay(date),
        ),
      )
      ..orderBy([(log) => OrderingTerm.desc(log.reviewedAt)]);
    return query.get();
  }

  Future<int> countReviewsToday() async {
    final count = _database.reviewLogs.id.count();
    final query = _database.selectOnly(_database.reviewLogs)
      ..addColumns([count])
      ..where(
        _database.reviewLogs.reviewedAt.isBetweenValues(
          startOfDay(DateTime.now()),
          endOfDay(DateTime.now()),
        ),
      );
    return (await query.getSingle()).read(count) ?? 0;
  }

  Future<double> getCorrectRate() async {
    final logs = await _database.select(_database.reviewLogs).get();
    if (logs.isEmpty) {
      return 0;
    }
    final correct = logs.where((log) => log.isCorrect).length;
    return correct / logs.length;
  }
}
