import 'package:drift/drift.dart';

class CodeTemplatesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get languageSlug => text().unique()();
  TextColumn get template => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
