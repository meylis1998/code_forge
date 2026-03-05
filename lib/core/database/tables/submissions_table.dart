import 'package:drift/drift.dart';

import 'problems_table.dart';

class SubmissionsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get problemId =>
      integer().references(ProblemsTable, #id)();
  TextColumn get titleSlug => text()();
  TextColumn get title => text()();
  TextColumn get lang => text()();
  TextColumn get code => text()();
  TextColumn get statusDisplay => text()(); // Accepted, Wrong Answer, etc.
  IntColumn get statusCode => integer().nullable()();
  TextColumn get runtime => text().nullable()();
  RealColumn get runtimePercentile => real().nullable()();
  TextColumn get memory => text().nullable()();
  RealColumn get memoryPercentile => real().nullable()();
  IntColumn get totalCorrect => integer().nullable()();
  IntColumn get totalTestcases => integer().nullable()();
  IntColumn get timestamp => integer()(); // Unix timestamp
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
