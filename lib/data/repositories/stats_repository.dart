import 'package:drift/drift.dart';

import '../../core/utils/date_utils.dart';
import '../local/app_database.dart';
import 'card_repository.dart';
import 'review_repository.dart';

class AppStats {
  const AppStats({
    required this.totalDecks,
    required this.totalCards,
    required this.learningCards,
    required this.masteredCards,
    required this.dueToday,
    required this.reviewsToday,
    required this.correctRate,
  });

  final int totalDecks;
  final int totalCards;
  final int learningCards;
  final int masteredCards;
  final int dueToday;
  final int reviewsToday;
  final double correctRate;
}

class StatsRepository {
  StatsRepository(this._database)
      : _reviewRepository = ReviewRepository(_database);

  final AppDatabase _database;
  final ReviewRepository _reviewRepository;

  Future<AppStats> getStats() async {
    final now = DateTime.now();
    final values = await Future.wait<int>([
      _count(_database.decks),
      _count(_database.cards),
      _countCardsByStatus(learningStatus),
      _countCardsByStatus(masteredStatus),
      _countDueCards(endOfDay(now)),
      _reviewRepository.countReviewsToday(),
    ]);
    return AppStats(
      totalDecks: values[0],
      totalCards: values[1],
      learningCards: values[2],
      masteredCards: values[3],
      dueToday: values[4],
      reviewsToday: values[5],
      correctRate: await _reviewRepository.getCorrectRate(),
    );
  }

  Future<int> _count(TableInfo<Table, Object?> table) async {
    final count = table.$primaryKey.first.count();
    final query = _database.selectOnly(table)..addColumns([count]);
    return (await query.getSingle()).read(count) ?? 0;
  }

  Future<int> _countCardsByStatus(String status) async {
    final count = _database.cards.id.count();
    final query = _database.selectOnly(_database.cards)
      ..addColumns([count])
      ..where(_database.cards.status.equals(status));
    return (await query.getSingle()).read(count) ?? 0;
  }

  Future<int> _countDueCards(DateTime endDate) async {
    final count = _database.cards.id.count();
    final query = _database.selectOnly(_database.cards)
      ..addColumns([count])
      ..where(
        _database.cards.status.equals(learningStatus) &
            _database.cards.nextReviewDate.isSmallerOrEqualValue(endDate),
      );
    return (await query.getSingle()).read(count) ?? 0;
  }
}
