import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../../../../core/database/daos/problem_dao.dart';
import '../../../../core/database/daos/topic_tag_dao.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/problem_entity.dart';
import '../../domain/entities/problem_filter.dart';

class ProblemLocalDataSource {
  ProblemLocalDataSource({
    required this.problemDao,
    required this.topicTagDao,
  });

  final ProblemDao problemDao;
  final TopicTagDao topicTagDao;

  Future<List<Problem>> getProblems(ProblemFilter filter) async {
    try {
      final problems = await problemDao.getProblems(
        limit: filter.pageSize,
        offset: filter.page * filter.pageSize,
        difficulty: filter.difficulty,
        status: filter.status,
        searchQuery: filter.searchQuery,
        tagSlugs: filter.tagSlugs,
        isFavorite: filter.isFavorite ? true : null,
      );

      final result = <Problem>[];
      for (final p in problems) {
        final tags = await problemDao.getTagsForProblem(p.id);
        result.add(_mapToEntity(p, tags));
      }
      return result;
    } catch (e) {
      throw CacheException(message: 'Failed to get problems: $e');
    }
  }

  Future<int> getProblemsCount(ProblemFilter filter) async {
    try {
      return problemDao.getProblemsCount(
        difficulty: filter.difficulty,
        status: filter.status,
        searchQuery: filter.searchQuery,
        tagSlugs: filter.tagSlugs,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to get problems count: $e');
    }
  }

  Future<Problem?> getProblemBySlug(String titleSlug) async {
    try {
      final problem = await problemDao.getProblemBySlug(titleSlug);
      if (problem == null) return null;

      final tags = await problemDao.getTagsForProblem(problem.id);
      final snippets = await problemDao.getCodeSnippets(problem.id);

      return _mapToEntityWithSnippets(problem, tags, snippets);
    } catch (e) {
      throw CacheException(message: 'Failed to get problem: $e');
    }
  }

  Future<List<TopicTag>> getAllTags() async {
    try {
      final tags = await topicTagDao.getAllTags();
      return tags
          .map(
            (t) => TopicTag(id: t.id, name: t.name, slug: t.slug),
          )
          .toList();
    } catch (e) {
      throw CacheException(message: 'Failed to get tags: $e');
    }
  }

  Future<void> saveProblems(List<Problem> problems) async {
    try {
      final companions = problems.map((p) {
        return ProblemsTableCompanion(
          id: Value(p.id),
          frontendId: Value(p.frontendId),
          title: Value(p.title),
          titleSlug: Value(p.titleSlug),
          difficulty: Value(p.difficulty),
          content: Value(p.content),
          acRate: Value(p.acRate),
          isPaidOnly: Value(p.isPaidOnly),
          status: Value(p.status),
          likes: Value(p.likes),
          dislikes: Value(p.dislikes),
          categoryTitle: Value(p.categoryTitle),
          isFavorite: Value(p.isFavorite),
          lastSynced: Value(DateTime.now()),
        );
      }).toList();

      await problemDao.upsertProblems(companions);

      // Save tags and links
      for (final problem in problems) {
        for (final tag in problem.topicTags) {
          await topicTagDao.upsertTag(
            TopicTagsTableCompanion(
              id: Value(tag.id),
              name: Value(tag.name),
              slug: Value(tag.slug),
            ),
          );
          await topicTagDao.linkProblemTag(problem.id, tag.id);
        }
      }
    } catch (e) {
      throw CacheException(message: 'Failed to save problems: $e');
    }
  }

  Future<void> saveCodeSnippets(
    int problemId,
    List<CodeSnippet> snippets,
  ) async {
    try {
      final companions = snippets
          .map(
            (s) => CodeSnippetsTableCompanion(
              problemId: Value(problemId),
              lang: Value(s.lang),
              langSlug: Value(s.langSlug),
              code: Value(s.code),
            ),
          )
          .toList();
      await problemDao.upsertCodeSnippets(companions);
    } catch (e) {
      throw CacheException(message: 'Failed to save code snippets: $e');
    }
  }

  Future<void> toggleFavorite(int problemId) async {
    try {
      await problemDao.toggleFavorite(problemId);
    } catch (e) {
      throw CacheException(message: 'Failed to toggle favorite: $e');
    }
  }

  Future<bool> hasProblems() async {
    final count =
        await problemDao.getProblemsCount();
    return count > 0;
  }

  Future<void> seedFromJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/problems.json');
      final jsonList = json.decode(jsonString) as List<dynamic>;

      final problems = jsonList.map((item) {
        final map = item as Map<String, dynamic>;
        final tags = (map['topicTags'] as List<dynamic>?)
                ?.map(
                  (t) => TopicTag(
                    id: (t as Map<String, dynamic>)['id'] as String? ?? '',
                    name: t['name'] as String? ?? '',
                    slug: t['slug'] as String? ?? '',
                  ),
                )
                .toList() ??
            [];

        return Problem(
          id: map['questionId'] as int? ??
              int.tryParse(map['questionId'].toString()) ??
              0,
          frontendId: map['questionFrontendId']?.toString() ?? '',
          title: map['title'] as String? ?? '',
          titleSlug: map['titleSlug'] as String? ?? '',
          difficulty: map['difficulty'] as String? ?? 'Easy',
          acRate: (map['acRate'] as num?)?.toDouble() ?? 0,
          isPaidOnly: map['isPaidOnly'] as bool? ?? false,
          topicTags: tags,
        );
      }).toList();

      await saveProblems(problems);
    } catch (e) {
      throw CacheException(message: 'Failed to seed from JSON: $e');
    }
  }

  Problem _mapToEntity(
    ProblemsTableData p,
    List<TopicTagsTableData> tags,
  ) {
    return Problem(
      id: p.id,
      frontendId: p.frontendId,
      title: p.title,
      titleSlug: p.titleSlug,
      difficulty: p.difficulty,
      content: p.content,
      acRate: p.acRate,
      isPaidOnly: p.isPaidOnly,
      status: p.status,
      likes: p.likes,
      dislikes: p.dislikes,
      categoryTitle: p.categoryTitle,
      isFavorite: p.isFavorite,
      topicTags: tags
          .map((t) => TopicTag(id: t.id, name: t.name, slug: t.slug))
          .toList(),
    );
  }

  Problem _mapToEntityWithSnippets(
    ProblemsTableData p,
    List<TopicTagsTableData> tags,
    List<CodeSnippetsTableData> snippets,
  ) {
    return Problem(
      id: p.id,
      frontendId: p.frontendId,
      title: p.title,
      titleSlug: p.titleSlug,
      difficulty: p.difficulty,
      content: p.content,
      acRate: p.acRate,
      isPaidOnly: p.isPaidOnly,
      status: p.status,
      likes: p.likes,
      dislikes: p.dislikes,
      categoryTitle: p.categoryTitle,
      hints: p.hints != null
          ? (json.decode(p.hints!) as List<dynamic>).cast<String>()
          : null,
      exampleTestcases: p.exampleTestcases,
      sampleTestCase: p.sampleTestCase,
      isFavorite: p.isFavorite,
      topicTags: tags
          .map((t) => TopicTag(id: t.id, name: t.name, slug: t.slug))
          .toList(),
      codeSnippets: snippets
          .map(
            (s) => CodeSnippet(
              lang: s.lang,
              langSlug: s.langSlug,
              code: s.code,
            ),
          )
          .toList(),
    );
  }
}
