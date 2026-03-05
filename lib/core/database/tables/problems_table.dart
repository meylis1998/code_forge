import 'package:drift/drift.dart';

class ProblemsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get frontendId => text()();
  TextColumn get title => text()();
  TextColumn get titleSlug => text().unique()();
  TextColumn get content => text().nullable()();
  TextColumn get difficulty => text()(); // Easy, Medium, Hard
  RealColumn get acRate => real().withDefault(const Constant(0))();
  BoolColumn get isPaidOnly => boolean().withDefault(const Constant(false))();
  TextColumn get status =>
      text().nullable()(); // null, 'ac', 'notac' (solved/attempted)
  IntColumn get likes => integer().withDefault(const Constant(0))();
  IntColumn get dislikes => integer().withDefault(const Constant(0))();
  TextColumn get categoryTitle => text().withDefault(const Constant(''))();
  TextColumn get hints => text().nullable()(); // JSON array
  TextColumn get similarQuestions => text().nullable()(); // JSON array
  TextColumn get exampleTestcases => text().nullable()();
  TextColumn get sampleTestCase => text().nullable()();
  TextColumn get stats => text().nullable()(); // JSON
  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastSynced =>
      dateTime().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
