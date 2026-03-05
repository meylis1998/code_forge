import 'package:drift/drift.dart';

import 'problems_table.dart';
import 'topic_tags_table.dart';

class ProblemTopicTagsTable extends Table {
  IntColumn get problemId => integer().references(ProblemsTable, #id)();
  TextColumn get tagId => text().references(TopicTagsTable, #id)();

  @override
  Set<Column> get primaryKey => {problemId, tagId};
}
