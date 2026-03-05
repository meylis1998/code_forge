// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_dao.dart';

// ignore_for_file: type=lint
mixin _$SubmissionDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProblemsTableTable get problemsTable => attachedDatabase.problemsTable;
  $SubmissionsTableTable get submissionsTable =>
      attachedDatabase.submissionsTable;
  SubmissionDaoManager get managers => SubmissionDaoManager(this);
}

class SubmissionDaoManager {
  final _$SubmissionDaoMixin _db;
  SubmissionDaoManager(this._db);
  $$ProblemsTableTableTableManager get problemsTable =>
      $$ProblemsTableTableTableManager(_db.attachedDatabase, _db.problemsTable);
  $$SubmissionsTableTableTableManager get submissionsTable =>
      $$SubmissionsTableTableTableManager(
        _db.attachedDatabase,
        _db.submissionsTable,
      );
}
