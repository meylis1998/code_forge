import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/graphql_queries.dart';
import '../../../../core/network/leetcode_api_client.dart';
import '../../domain/entities/contest.dart';

class ContestRemoteDataSource {
  ContestRemoteDataSource(this._apiClient);

  final LeetCodeApiClient _apiClient;

  Future<List<Contest>> getContests() async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.allContests,
      );

      final data = response['data'] as Map<String, dynamic>?;
      final contests = data?['allContests'] as List<dynamic>? ?? [];

      return contests.map((c) {
        final map = c as Map<String, dynamic>;
        return Contest(
          title: map['title'] as String? ?? '',
          titleSlug: map['titleSlug'] as String? ?? '',
          startTime: DateTime.fromMillisecondsSinceEpoch(
            ((map['startTime'] as num?)?.toInt() ?? 0) * 1000,
          ),
          duration: (map['duration'] as num?)?.toInt() ?? 0,
          isVirtual: map['isVirtual'] as bool? ?? false,
          containsPremium: map['containsPremium'] as bool? ?? false,
        );
      }).toList();
    } catch (e) {
      if (e is ServerException || e is NetworkException || e is AuthException) {
        rethrow;
      }
      throw ServerException(message: 'Failed to fetch contests: $e');
    }
  }
}
