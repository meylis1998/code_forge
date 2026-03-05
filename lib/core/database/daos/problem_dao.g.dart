// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_dao.dart';

// ignore_for_file: type=lint
mixin _$ProblemDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProblemsTableTable get problemsTable => attachedDatabase.problemsTable;
  $TopicTagsTableTable get topicTagsTable => attachedDatabase.topicTagsTable;
  $ProblemTopicTagsTableTable get problemTopicTagsTable =>
      attachedDatabase.problemTopicTagsTable;
  $CodeSnippetsTableTable get codeSnippetsTable =>
      attachedDatabase.codeSnippetsTable;
  ProblemDaoManager get managers => ProblemDaoManager(this);
}

class ProblemDaoManager {
  final _$ProblemDaoMixin _db;
  ProblemDaoManager(this._db);
  $$ProblemsTableTableTableManager get problemsTable =>
      $$ProblemsTableTableTableManager(_db.attachedDatabase, _db.problemsTable);
  $$TopicTagsTableTableTableManager get topicTagsTable =>
      $$TopicTagsTableTableTableManager(
        _db.attachedDatabase,
        _db.topicTagsTable,
      );
  $$ProblemTopicTagsTableTableTableManager get problemTopicTagsTable =>
      $$ProblemTopicTagsTableTableTableManager(
        _db.attachedDatabase,
        _db.problemTopicTagsTable,
      );
  $$CodeSnippetsTableTableTableManager get codeSnippetsTable =>
      $$CodeSnippetsTableTableTableManager(
        _db.attachedDatabase,
        _db.codeSnippetsTable,
      );
}
