import 'package:drift/drift.dart';

class TopicTagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get slug => text().unique()();

  @override
  Set<Column> get primaryKey => {id};
}
