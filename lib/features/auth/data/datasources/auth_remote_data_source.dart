import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/graphql_queries.dart';
import '../../../../core/network/leetcode_api_client.dart';
import '../../domain/entities/auth_state_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUser> validateSession(String username);
  Future<AuthUser> checkGlobalSession();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._apiClient);

  final LeetCodeApiClient _apiClient;

  @override
  Future<AuthUser> validateSession(String username) async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.userProfile,
        variables: {'username': username},
      );

      final data = response['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw const AuthException(message: 'Invalid session');
      }

      final matchedUser = data['matchedUser'] as Map<String, dynamic>?;
      if (matchedUser == null) {
        throw const AuthException(message: 'User not found');
      }

      final profile = matchedUser['profile'] as Map<String, dynamic>?;

      return AuthUser(
        username: matchedUser['username'] as String,
        realName: profile?['realName'] as String?,
        ranking: profile?['ranking'] as int?,
      );
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(message: 'Failed to validate session: $e');
    }
  }

  @override
  Future<AuthUser> checkGlobalSession() async {
    try {
      final response = await _apiClient.graphql(
        query: GraphQLQueries.globalData,
      );

      final data = response['data'] as Map<String, dynamic>?;
      final userStatus = data?['userStatus'] as Map<String, dynamic>?;

      if (userStatus == null) {
        throw const AuthException(message: 'Invalid session');
      }

      final isSignedIn = userStatus['isSignedIn'] as bool? ?? false;
      if (!isSignedIn) {
        throw const AuthException(message: 'Session expired');
      }

      final username = userStatus['username'] as String? ?? '';
      return AuthUser(
        username: username,
        isPremium: userStatus['isPremium'] as bool? ?? false,
      );
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(message: 'Failed to check session: $e');
    }
  }
}
