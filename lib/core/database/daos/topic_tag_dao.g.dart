// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_tag_dao.dart';

// ignore_for_file: type=lint
mixin _$TopicTagDaoMixin on DatabaseAccessor<AppDatabase> {
  $TopicTagsTableTable get topicTagsTable => attachedDatabase.topicTagsTable;
  $ProblemsTableTable get problemsTable => attachedDatabase.problemsTable;
  $ProblemTopicTagsTableTable get problemTopicTagsTable =>
      attachedDatabase.problemTopicTagsTable;
  TopicTagDaoManager get managers => TopicTagDaoManager(this);
}

class TopicTagDaoManager {
  final _$TopicTagDaoMixin _db;
  TopicTagDaoManager(this._db);
  $$TopicTagsTableTableTableManager get topicTagsTable =>
      $$TopicTagsTableTableTableManager(
        _db.attachedDatabase,
        _db.topicTagsTable,
      );
  $$ProblemsTableTableTableManager get problemsTable =>
      $$ProblemsTableTableTableManager(_db.attachedDatabase, _db.problemsTable);
  $$ProblemTopicTagsTableTableTableManager get problemTopicTagsTable =>
      $$ProblemTopicTagsTableTableTableManager(
        _db.attachedDatabase,
        _db.problemTopicTagsTable,
      );
}
