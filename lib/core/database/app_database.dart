import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/code_template_dao.dart';
import 'daos/note_dao.dart';
import 'daos/problem_dao.dart';
import 'daos/submission_dao.dart';
import 'daos/topic_tag_dao.dart';
import 'daos/user_progress_dao.dart';
import 'tables/code_snippets_table.dart';
import 'tables/code_templates_table.dart';
import 'tables/notes_table.dart';
import 'tables/problem_topic_tags_table.dart';
import 'tables/problems_table.dart';
import 'tables/submissions_table.dart';
import 'tables/topic_tags_table.dart';
import 'tables/user_progress_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ProblemsTable,
    TopicTagsTable,
    ProblemTopicTagsTable,
    CodeSnippetsTable,
    SubmissionsTable,
    UserProgressTable,
    NotesTable,
    CodeTemplatesTable,
  ],
  daos: [
    ProblemDao,
    TopicTagDao,
    SubmissionDao,
    UserProgressDao,
    NoteDao,
    CodeTemplateDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 3;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'code_forge_db');
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(notesTable);
        }
        if (from < 3) {
          await m.createTable(codeTemplatesTable);
        }
      },
    );
  }
}
