import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/graphql_queries.dart';
import '../../../../core/network/leetcode_api_client.dart';
import '../../domain/entities/user_stats.dart';

class DashboardRemoteDataSource {
  DashboardRemoteDataSource(this._apiClient);

  final LeetCodeApiClient _apiClient;

  Future<UserStats> getUserStats(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.userStats,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw const ServerException(message: 'No data in response');
      }

      final allQuestions = data['allQuestionsCount'] as List<dynamic>? ?? [];
      final matchedUser = data['matchedUser'] as Map<String, dynamic>?;

      if (matchedUser == null) {
        throw const ServerException(message: 'User not found');
      }

      final submitStats =
          matchedUser['submitStats'] as Map<String, dynamic>? ?? {};
      final acSubmissions =
          submitStats['acSubmissionNum'] as List<dynamic>? ?? [];
      final calendar =
          matchedUser['userCalendar'] as Map<String, dynamic>? ?? {};
      final profile =
          matchedUser['profile'] as Map<String, dynamic>? ?? {};

      // Parse submission calendar
      final calendarJson =
          calendar['submissionCalendar'] as String? ?? '{}';
      final calendarMap =
          (json.decode(calendarJson) as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, (value as num).toInt()),
      );

      // Parse active years
      final activeYears = (calendar['activeYears'] as List<dynamic>?)
              ?.map((y) => (y as num).toInt())
              .toList() ??
          [];

      return UserStats(
        username: username,
        easySolved: _getCountByDifficulty(acSubmissions, 'Easy'),
        mediumSolved: _getCountByDifficulty(acSubmissions, 'Medium'),
        hardSolved: _getCountByDifficulty(acSubmissions, 'Hard'),
        totalSolved: _getCountByDifficulty(acSubmissions, 'All'),
        easyTotal: _getCountByDifficulty(allQuestions, 'Easy'),
        mediumTotal: _getCountByDifficulty(allQuestions, 'Medium'),
        hardTotal: _getCountByDifficulty(allQuestions, 'Hard'),
        totalQuestions: _getCountByDifficulty(allQuestions, 'All'),
        ranking: profile['ranking'] as int? ?? 0,
        reputation: profile['reputation'] as int? ?? 0,
        streak: calendar['streak'] as int? ?? 0,
        totalActiveDays: calendar['totalActiveDays'] as int? ?? 0,
        submissionCalendar: calendarMap,
        activeYears: activeYears,
      );
    } catch (e) {
      if (e is ServerException || e is AuthException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch user stats: $e');
    }
  }

  Future<DailyChallenge> getDailyChallenge() async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.dailyChallenge,
      );

      final data = response['data'] as Map<String, dynamic>?;
      final challenge = data?['activeDailyCodingChallengeQuestion']
          as Map<String, dynamic>?;

      if (challenge == null) {
        throw const ServerException(message: 'No daily challenge found');
      }

      final question = challenge['question'] as Map<String, dynamic>? ?? {};
      final tags = (question['topicTags'] as List<dynamic>?)
              ?.map((t) => (t as Map<String, dynamic>)['name'] as String? ?? '')
              .where((t) => t.isNotEmpty)
              .toList() ??
          [];

      return DailyChallenge(
        date: challenge['date'] as String? ?? '',
        link: challenge['link'] as String?,
        userStatus: challenge['userStatus'] as String?,
        questionId: question['questionId']?.toString() ?? '',
        frontendId: question['questionFrontendId']?.toString() ?? '',
        title: question['title'] as String? ?? '',
        titleSlug: question['titleSlug'] as String? ?? '',
        difficulty: question['difficulty'] as String? ?? 'Easy',
        acRate: (question['acRate'] as num?)?.toDouble() ?? 0,
        isPaidOnly: question['isPaidOnly'] as bool? ?? false,
        topicTags: tags,
      );
    } catch (e) {
      if (e is ServerException || e is AuthException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch daily challenge: $e');
    }
  }

  Future<ContestStats> getContestStats(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.contestRankingInfo,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      if (data == null) {
        return const ContestStats();
      }

      final ranking = data['userContestRanking'] as Map<String, dynamic>?;
      final historyList =
          data['userContestRankingHistory'] as List<dynamic>? ?? [];

      final history = historyList
          .where((h) => (h as Map<String, dynamic>)['attended'] == true)
          .map((h) {
        final map = h as Map<String, dynamic>;
        final contest = map['contest'] as Map<String, dynamic>? ?? {};
        return ContestRecord(
          contestTitle: contest['title'] as String? ?? '',
          contestStartTime: contest['startTime'] as int? ?? 0,
          attended: map['attended'] as bool? ?? false,
          problemsSolved: map['problemsSolved'] as int? ?? 0,
          totalProblems: map['totalProblems'] as int? ?? 0,
          finishTimeInSeconds: map['finishTimeInSeconds'] as int? ?? 0,
          rating: (map['rating'] as num?)?.toDouble() ?? 0,
          ranking: map['ranking'] as int? ?? 0,
          trendDirection: map['trendDirection'] as String?,
        );
      }).toList();

      if (ranking == null) {
        return ContestStats(history: history);
      }

      return ContestStats(
        attendedContestsCount:
            ranking['attendedContestsCount'] as int? ?? 0,
        rating: (ranking['rating'] as num?)?.toDouble() ?? 0,
        globalRanking: ranking['globalRanking'] as int? ?? 0,
        totalParticipants: ranking['totalParticipants'] as int? ?? 0,
        topPercentage: (ranking['topPercentage'] as num?)?.toDouble() ?? 0,
        badgeName:
            (ranking['badge'] as Map<String, dynamic>?)?['name'] as String?,
        history: history,
      );
    } catch (e) {
      if (e is ServerException || e is AuthException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch contest stats: $e');
    }
  }

  Future<List<LanguageStat>> getLanguageStats(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.languageStats,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      final matchedUser = data?['matchedUser'] as Map<String, dynamic>?;
      final langList =
          matchedUser?['languageProblemCount'] as List<dynamic>? ?? [];

      return langList
          .map((l) {
            final map = l as Map<String, dynamic>;
            return LanguageStat(
              languageName: map['languageName'] as String? ?? '',
              problemsSolved: map['problemsSolved'] as int? ?? 0,
            );
          })
          .where((l) => l.problemsSolved > 0)
          .toList()
        ..sort((a, b) => b.problemsSolved.compareTo(a.problemsSolved));
    } catch (e) {
      if (e is ServerException || e is AuthException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch language stats: $e');
    }
  }

  Future<SkillStats> getSkillStats(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.skillStats,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      final matchedUser = data?['matchedUser'] as Map<String, dynamic>?;
      final tagCounts =
          matchedUser?['tagProblemCounts'] as Map<String, dynamic>? ?? {};

      return SkillStats(
        fundamental: _parseTagSkills(tagCounts['fundamental']),
        intermediate: _parseTagSkills(tagCounts['intermediate']),
        advanced: _parseTagSkills(tagCounts['advanced']),
      );
    } catch (e) {
      if (e is ServerException || e is AuthException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch skill stats: $e');
    }
  }

  Future<Map<String, double>> getBeatsPercentage(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.userQuestionProgress,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      final progress =
          data?['userProfileUserQuestionProgressV2'] as Map<String, dynamic>?;
      if (progress == null) return {};

      final beats =
          progress['userSessionBeatsPercentage'] as List<dynamic>? ?? [];
      final result = <String, double>{};
      for (final b in beats) {
        final map = b as Map<String, dynamic>;
        final diff = map['difficulty'] as String?;
        final pct = (map['percentage'] as num?)?.toDouble();
        if (diff != null && pct != null) {
          result[diff] = pct;
        }
      }
      return result;
    } catch (e) {
      return {};
    }
  }

  List<TagSkill> _parseTagSkills(dynamic list) {
    if (list is! List) return [];
    return list
        .map((t) {
          final map = t as Map<String, dynamic>;
          return TagSkill(
            tagName: map['tagName'] as String? ?? '',
            tagSlug: map['tagSlug'] as String? ?? '',
            problemsSolved: map['problemsSolved'] as int? ?? 0,
          );
        })
        .where((t) => t.problemsSolved > 0)
        .toList()
      ..sort((a, b) => b.problemsSolved.compareTo(a.problemsSolved));
  }

  int _getCountByDifficulty(List<dynamic> items, String difficulty) {
    for (final item in items) {
      final map = item as Map<String, dynamic>;
      if (map['difficulty'] == difficulty) {
        return map['count'] as int? ?? 0;
      }
    }
    return 0;
  }
}
