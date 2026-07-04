import 'package:drift/drift.dart';

import '../local/app_database.dart';

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
