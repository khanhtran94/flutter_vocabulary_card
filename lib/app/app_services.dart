import '../data/local/app_database.dart';
import '../data/repositories/card_repository.dart';
import '../data/repositories/deck_repository.dart';
import '../data/repositories/review_repository.dart';
import '../data/repositories/stats_repository.dart';

class AppServices {
  AppServices._() {
    deckRepository = DeckRepository(database);
    cardRepository = CardRepository(database);
    reviewRepository = ReviewRepository(database);
    statsRepository = StatsRepository(database);
  }

  static final AppServices instance = AppServices._();

  final AppDatabase database = AppDatabase();
  late final DeckRepository deckRepository;
  late final CardRepository cardRepository;
  late final ReviewRepository reviewRepository;
  late final StatsRepository statsRepository;
}
