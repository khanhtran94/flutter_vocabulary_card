import 'package:drift/drift.dart';

import 'cards.dart';

class ReviewLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId =>
      integer().references(Cards, #id, onDelete: KeyAction.cascade)();
  BoolColumn get isCorrect => boolean()();
  TextColumn get answerType => text()();
  DateTimeColumn get reviewedAt => dateTime()();
}
