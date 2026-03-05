import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/code_snippets_table.dart';
import '../tables/problem_topic_tags_table.dart';
import '../tables/problems_table.dart';
import '../tables/topic_tags_table.dart';

part 'problem_dao.g.dart';

@DriftAccessor(
  tables: [
    ProblemsTable,
    TopicTagsTable,
    ProblemTopicTagsTable,
    CodeSnippetsTable,
  ],
)
class ProblemDao extends DatabaseAccessor<AppDatabase> with _$ProblemDaoMixin {
  ProblemDao(super.db);

  // Get all problems with optional filters
  Future<List<ProblemsTableData>> getProblems({
    int? limit,
    int? offset,
    String? difficulty,
    String? status,
    String? searchQuery,
    List<String>? tagSlugs,
    bool? isFavorite,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = select(problemsTable);

    if (difficulty != null) {
      query = query..where((p) => p.difficulty.equals(difficulty));
    }

    if (status != null) {
      query = query..where((p) => p.status.equals(status));
    }

    if (isFavorite == true) {
      query = query..where((p) => p.isFavorite.equals(true));
    }

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query
        ..where(
          (p) =>
              p.title.like('%$searchQuery%') |
              p.frontendId.like('%$searchQuery%'),
        );
    }

    if (tagSlugs != null && tagSlugs.isNotEmpty) {
      // Subquery: get problem IDs that have ALL the specified tags
      final taggedProblemIds = selectOnly(problemTopicTagsTable)
        ..addColumns([problemTopicTagsTable.problemId])
        ..join([
          innerJoin(
            topicTagsTable,
            topicTagsTable.id.equalsExp(problemTopicTagsTable.tagId),
          ),
        ])
        ..where(topicTagsTable.slug.isIn(tagSlugs));

      query = query
        ..where(
          (p) => p.id.isInQuery(taggedProblemIds),
        );
    }

    query
      ..orderBy([
        (p) => OrderingTerm(
          expression: p.frontendId,
          mode: ascending ? OrderingMode.asc : OrderingMode.desc,
        ),
      ])
      ..limit(limit ?? 50, offset: offset ?? 0);

    return query.get();
  }

  // Get problem count with filters
  Future<int> getProblemsCount({
    String? difficulty,
    String? status,
    String? searchQuery,
    List<String>? tagSlugs,
  }) async {
    final countExp = problemsTable.id.count();
    var query = selectOnly(problemsTable)..addColumns([countExp]);

    if (difficulty != null) {
      query.where(problemsTable.difficulty.equals(difficulty));
    }

    if (status != null) {
      query.where(problemsTable.status.equals(status));
    }

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query.where(
        problemsTable.title.like('%$searchQuery%') |
            problemsTable.frontendId.like('%$searchQuery%'),
      );
    }

    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  // Get single problem by titleSlug
  Future<ProblemsTableData?> getProblemBySlug(String titleSlug) {
    return (select(
      problemsTable,
    )..where((p) => p.titleSlug.equals(titleSlug))).getSingleOrNull();
  }

  // Get single problem by id
  Future<ProblemsTableData?> getProblemById(int id) {
    return (select(
      problemsTable,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // Upsert a problem
  Future<void> upsertProblem(ProblemsTableCompanion problem) {
    return into(problemsTable).insertOnConflictUpdate(problem);
  }

  // Batch upsert problems
  Future<void> upsertProblems(List<ProblemsTableCompanion> problems) {
    return batch((b) {
      b.insertAllOnConflictUpdate(problemsTable, problems);
    });
  }

  // Update problem status
  Future<void> updateProblemStatus(int problemId, String? status) {
    return (update(problemsTable)..where((p) => p.id.equals(problemId))).write(
      ProblemsTableCompanion(status: Value(status)),
    );
  }

  // Get code snippets for a problem
  Future<List<CodeSnippetsTableData>> getCodeSnippets(int problemId) {
    return (select(
      codeSnippetsTable,
    )..where((s) => s.problemId.equals(problemId))).get();
  }

  // Upsert code snippet
  Future<void> upsertCodeSnippet(CodeSnippetsTableCompanion snippet) {
    return into(codeSnippetsTable).insertOnConflictUpdate(snippet);
  }

  // Batch upsert code snippets
  Future<void> upsertCodeSnippets(
    List<CodeSnippetsTableCompanion> snippets,
  ) {
    return batch((b) {
      b.insertAllOnConflictUpdate(codeSnippetsTable, snippets);
    });
  }

  // Toggle favorite
  Future<void> toggleFavorite(int problemId) async {
    final problem = await getProblemById(problemId);
    if (problem != null) {
      await (update(problemsTable)..where((p) => p.id.equals(problemId))).write(
        ProblemsTableCompanion(
          isFavorite: Value(!problem.isFavorite),
        ),
      );
    }
  }

  // Watch problems (for reactive UI)
  Stream<List<ProblemsTableData>> watchProblems({
    int? limit,
    int? offset,
  }) {
    return (select(problemsTable)
          ..orderBy([(p) => OrderingTerm.asc(p.frontendId)])
          ..limit(limit ?? 50, offset: offset ?? 0))
        .watch();
  }

  // Get problem with tags
  Future<List<TopicTagsTableData>> getTagsForProblem(int problemId) async {
    final query = select(topicTagsTable).join([
      innerJoin(
        problemTopicTagsTable,
        problemTopicTagsTable.tagId.equalsExp(topicTagsTable.id),
      ),
    ])..where(problemTopicTagsTable.problemId.equals(problemId));

    final results = await query.get();
    return results.map((row) => row.readTable(topicTagsTable)).toList();
  }
}
