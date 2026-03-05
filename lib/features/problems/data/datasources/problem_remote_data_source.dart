import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/graphql_queries.dart';
import '../../../../core/network/leetcode_api_client.dart';
import '../../../editor/domain/entities/solution.dart';
import '../../domain/entities/problem_entity.dart';

class ProblemRemoteDataSource {
  ProblemRemoteDataSource(this._apiClient);

  final LeetCodeApiClient _apiClient;

  Future<List<Problem>> getProblems({
    int limit = 50,
    int skip = 0,
    String? difficulty,
    String? status,
    List<String>? tags,
    String? searchKeywords,
  }) async {
    try {
      final filters = <String, dynamic>{};
      if (difficulty != null) filters['difficulty'] = difficulty.toUpperCase();
      if (status != null) filters['status'] = status.toUpperCase();
      if (tags != null && tags.isNotEmpty) filters['tags'] = tags;
      if (searchKeywords != null && searchKeywords.isNotEmpty) {
        filters['searchKeywords'] = searchKeywords;
      }

      final response = await _apiClient.graphql(
        query: GraphQLQueries.problemsetQuestionList,
        variables: {
          'categorySlug': '',
          'limit': limit,
          'skip': skip,
          'filters': filters,
        },
      );

      final data = response['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw const ServerException(message: 'No data in response');
      }

      final questionList =
          data['problemsetQuestionList'] as Map<String, dynamic>?;
      if (questionList == null) return [];

      final questions = questionList['questions'] as List<dynamic>? ?? [];

      return questions.map((q) {
        final map = q as Map<String, dynamic>;
        final topicTags =
            (map['topicTags'] as List<dynamic>?)
                ?.map(
                  (t) => TopicTag(
                    id: (t as Map<String, dynamic>)['id']?.toString() ?? '',
                    name: t['name'] as String? ?? '',
                    slug: t['slug'] as String? ?? '',
                  ),
                )
                .toList() ??
            [];

        return Problem(
          id:
              int.tryParse(
                map['frontendQuestionId']?.toString() ?? '',
              ) ??
              0,
          frontendId: map['frontendQuestionId']?.toString() ?? '',
          title: map['title'] as String? ?? '',
          titleSlug: map['titleSlug'] as String? ?? '',
          difficulty: map['difficulty'] as String? ?? 'Easy',
          acRate: (map['acRate'] as num?)?.toDouble() ?? 0,
          isPaidOnly: map['paidOnly'] as bool? ?? false,
          status: map['status'] as String?,
          isFavorite: map['isFavor'] as bool? ?? false,
          hasSolution: map['hasSolution'] as bool? ?? false,
          hasVideoSolution: map['hasVideoSolution'] as bool? ?? false,
          topicTags: topicTags,
        );
      }).toList();
    } catch (e) {
      if (e is ServerException || e is NetworkException || e is AuthException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch problems: $e');
    }
  }

  Future<Problem> getProblemDetail(String titleSlug) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.questionDetail,
        variables: {'titleSlug': titleSlug},
      );

      final data = response['data'] as Map<String, dynamic>?;
      final question = data?['question'] as Map<String, dynamic>?;

      if (question == null) {
        throw const ServerException(message: 'Problem not found');
      }

      final topicTags =
          (question['topicTags'] as List<dynamic>?)
              ?.map(
                (t) => TopicTag(
                  id: (t as Map<String, dynamic>)['id']?.toString() ?? '',
                  name: t['name'] as String? ?? '',
                  slug: t['slug'] as String? ?? '',
                ),
              )
              .toList() ??
          [];

      final codeSnippets =
          (question['codeSnippets'] as List<dynamic>?)
              ?.map(
                (s) => CodeSnippet(
                  lang: (s as Map<String, dynamic>)['lang'] as String? ?? '',
                  langSlug: s['langSlug'] as String? ?? '',
                  code: s['code'] as String? ?? '',
                ),
              )
              .toList() ??
          [];

      // Parse similarQuestions JSON string
      final similarQuestions = _parseSimilarQuestions(
        question['similarQuestions'] as String?,
      );

      // Parse metaData JSON string
      final metaData = _parseMetaData(question['metaData'] as String?);

      // Parse stats JSON string
      final stats = _parseStats(question['stats'] as String?);

      return Problem(
        id: int.tryParse(question['questionId']?.toString() ?? '') ?? 0,
        frontendId: question['questionFrontendId']?.toString() ?? '',
        title: question['title'] as String? ?? '',
        titleSlug: question['titleSlug'] as String? ?? '',
        content: question['content'] as String?,
        difficulty: question['difficulty'] as String? ?? 'Easy',
        acRate: (question['acRate'] as num?)?.toDouble() ?? 0,
        isPaidOnly: question['isPaidOnly'] as bool? ?? false,
        status: question['status'] as String?,
        likes: question['likes'] as int? ?? 0,
        dislikes: question['dislikes'] as int? ?? 0,
        categoryTitle: question['categoryTitle'] as String? ?? '',
        hints: (question['hints'] as List<dynamic>?)?.cast<String>(),
        exampleTestcases: (question['exampleTestcaseList'] as List<dynamic>?)
            ?.join('\n'),
        sampleTestCase: question['sampleTestCase'] as String?,
        topicTags: topicTags,
        codeSnippets: codeSnippets,
        similarQuestions: similarQuestions,
        metaData: metaData,
        stats: stats,
      );
    } catch (e) {
      if (e is ServerException || e is NetworkException || e is AuthException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch problem detail: $e');
    }
  }

  Future<Solution?> getSolution(String titleSlug) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.officialSolution,
        variables: {'titleSlug': titleSlug},
      );

      final data = response['data'] as Map<String, dynamic>?;
      final question = data?['question'] as Map<String, dynamic>?;
      final solution = question?['solution'] as Map<String, dynamic>?;

      if (solution == null) return null;

      return Solution(
        id: solution['id'] as int? ?? 0,
        title: solution['title'] as String? ?? '',
        content: solution['content'] as String? ?? '',
        isPaidOnly: solution['paidOnly'] as bool? ?? false,
        hasVideoSolution: solution['hasVideoSolution'] as bool? ?? false,
        canSeeDetail: solution['canSeeDetail'] as bool? ?? true,
      );
    } catch (e) {
      if (e is ServerException || e is NetworkException || e is AuthException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch solution: $e');
    }
  }

  List<SimilarQuestion> _parseSimilarQuestions(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return [];
    try {
      final list = json.decode(jsonStr) as List<dynamic>;
      return list.map((item) {
        final map = item as Map<String, dynamic>;
        return SimilarQuestion(
          title: map['title'] as String? ?? '',
          titleSlug: map['titleSlug'] as String? ?? '',
          difficulty: map['difficulty'] as String? ?? '',
          isPaidOnly: map['isPaidOnly'] == 'true' || map['isPaidOnly'] == true,
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  ProblemMetaData? _parseMetaData(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return null;
    try {
      final map = json.decode(jsonStr) as Map<String, dynamic>;
      final params =
          (map['params'] as List<dynamic>?)?.map((p) {
            final pm = p as Map<String, dynamic>;
            return ParamInfo(
              name: pm['name'] as String? ?? '',
              type: pm['type'] as String? ?? '',
            );
          }).toList() ??
          [];

      return ProblemMetaData(
        name: map['name'] as String?,
        params: params,
        returnType:
            (map['return'] as Map<String, dynamic>?)?['type'] as String?,
      );
    } catch (_) {
      return null;
    }
  }

  ProblemStats? _parseStats(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return null;
    try {
      final map = json.decode(jsonStr) as Map<String, dynamic>;
      return ProblemStats(
        totalAccepted: map['totalAccepted'] as String? ?? '',
        totalSubmission: map['totalSubmission'] as String? ?? '',
        totalAcceptedRaw: map['totalAcceptedRaw'] as int? ?? 0,
        totalSubmissionRaw: map['totalSubmissionRaw'] as int? ?? 0,
        acRate: map['acRate'] as String? ?? '',
      );
    } catch (_) {
      return null;
    }
  }
}
