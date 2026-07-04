import 'package:drift/drift.dart';

import '../../core/utils/date_utils.dart';
import '../local/app_database.dart';

class NewCardRecord {
  const NewCardRecord({
    required this.english,
    required this.vietnamese,
    this.audioPath,
  });

  final String english;
  final String vietnamese;
  final String? audioPath;
}

class DeckRepository {
  DeckRepository(this._database);

  final AppDatabase _database;

  Future<int> createDeck({
    required String name,
    String? description,
  }) {
    final now = DateTime.now();
    return _database.into(_database.decks).insert(
          DecksCompanion.insert(
            name: name.trim(),
            description: Value(_nullIfBlank(description)),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<int> createDeckWithCards({
    required String name,
    String? description,
    required List<NewCardRecord> cards,
  }) {
    return _database.transaction(() async {
      final now = DateTime.now();
      final deckId = await _database.into(_database.decks).insert(
            DecksCompanion.insert(
              name: name.trim(),
              description: Value(_nullIfBlank(description)),
              createdAt: now,
              updatedAt: now,
            ),
          );
      await _database.batch((batch) {
        batch.insertAll(
          _database.cards,
          cards
              .map(
                (card) => CardsCompanion.insert(
                  deckId: deckId,
                  english: card.english.trim(),
                  vietnamese: card.vietnamese.trim(),
                  audioPath: Value(_nullIfBlank(card.audioPath)),
                  nextReviewDate: startOfDay(now),
                  createdAt: now,
                  updatedAt: now,
                ),
              )
              .toList(),
        );
      });
      return deckId;
    });
  }

  Future<List<Deck>> getAllDecks() {
    final query = _database.select(_database.decks)
      ..orderBy([(deck) => OrderingTerm.desc(deck.updatedAt)]);
    return query.get();
  }

  Future<Deck?> getDeckById(int id) {
    final query = _database.select(_database.decks)
      ..where((deck) => deck.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<void> updateDeck({
    required int id,
    required String name,
    String? description,
  }) async {
    await (_database.update(_database.decks)
          ..where((deck) => deck.id.equals(id)))
        .write(
      DecksCompanion(
        name: Value(name.trim()),
        description: Value(_nullIfBlank(description)),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteDeck(int id) async {
    await (_database.delete(_database.decks)
          ..where((deck) => deck.id.equals(id)))
        .go();
  }
}

String? _nullIfBlank(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
