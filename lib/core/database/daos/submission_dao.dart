import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/submissions_table.dart';

part 'submission_dao.g.dart';

@DriftAccessor(tables: [SubmissionsTable])
class SubmissionDao extends DatabaseAccessor<AppDatabase>
    with _$SubmissionDaoMixin {
  SubmissionDao(super.db);

  // Get submissions for a problem
  Future<List<SubmissionsTableData>> getSubmissionsForProblem(
    int problemId, {
    int? limit,
    int? offset,
  }) {
    return (select(submissionsTable)
          ..where((s) => s.problemId.equals(problemId))
          ..orderBy([(s) => OrderingTerm.desc(s.timestamp)])
          ..limit(limit ?? 20, offset: offset ?? 0))
        .get();
  }

  // Get all submissions
  Future<List<SubmissionsTableData>> getSubmissions({
    int? limit,
    int? offset,
    String? lang,
    String? statusDisplay,
  }) {
    var query = select(submissionsTable);

    if (lang != null) {
      query = query..where((s) => s.lang.equals(lang));
    }

    if (statusDisplay != null) {
      query = query..where((s) => s.statusDisplay.equals(statusDisplay));
    }

    query
      ..orderBy([(s) => OrderingTerm.desc(s.timestamp)])
      ..limit(limit ?? 20, offset: offset ?? 0);

    return query.get();
  }

  // Insert submission
  Future<void> insertSubmission(SubmissionsTableCompanion submission) {
    return into(submissionsTable).insertOnConflictUpdate(submission);
  }

  // Batch insert submissions
  Future<void> insertSubmissions(
    List<SubmissionsTableCompanion> submissions,
  ) {
    return batch((b) {
      b.insertAllOnConflictUpdate(submissionsTable, submissions);
    });
  }

  // Get latest submission for a problem
  Future<SubmissionsTableData?> getLatestSubmission(int problemId) {
    return (select(submissionsTable)
          ..where((s) => s.problemId.equals(problemId))
          ..orderBy([(s) => OrderingTerm.desc(s.timestamp)])
          ..limit(1))
        .getSingleOrNull();
  }

  // Get accepted submission count
  Future<int> getAcceptedCount() async {
    final countExp = submissionsTable.id.count();
    final query = selectOnly(submissionsTable)
      ..addColumns([countExp])
      ..where(submissionsTable.statusDisplay.equals('Accepted'));

    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  // Watch submissions for a problem
  Stream<List<SubmissionsTableData>> watchSubmissionsForProblem(
    int problemId,
  ) {
    return (select(submissionsTable)
          ..where((s) => s.problemId.equals(problemId))
          ..orderBy([(s) => OrderingTerm.desc(s.timestamp)]))
        .watch();
  }
}
