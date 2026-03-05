import 'package:drift/drift.dart';

import 'problems_table.dart';

class CodeSnippetsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get problemId =>
      integer().references(ProblemsTable, #id)();
  TextColumn get lang => text()();
  TextColumn get langSlug => text()();
  TextColumn get code => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {problemId, langSlug},
      ];
}
