import 'package:drift/drift.dart';

import 'decks.dart';

class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId =>
      integer().references(Decks, #id, onDelete: KeyAction.cascade)();
  TextColumn get english => text()();
  TextColumn get vietnamese => text()();
  TextColumn get audioPath => text().nullable()();
  IntColumn get reviewCount => integer().withDefault(const Constant(0))();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('learning'))();
  DateTimeColumn get nextReviewDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {deckId, english},
      ];
}
