import 'package:drift/drift.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get problemId => integer().unique()();
  TextColumn get content => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
