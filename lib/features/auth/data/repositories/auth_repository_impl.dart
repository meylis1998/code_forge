import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/storage/secure_storage_helper.dart';
import '../../domain/entities/auth_state_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageHelper secureStorage;

  @override
  Future<Either<Failure, AuthUser>> login({
    required String session,
    required String csrfToken,
  }) async {
    try {
      // Save credentials first so the interceptor picks them up
      await secureStorage.saveLeetCodeSession(session);
      await secureStorage.saveCsrfToken(csrfToken);

      // Validate via globalData query (checks isSignedIn)
      final user = await remoteDataSource.checkGlobalSession();

      // Save the username returned by LeetCode
      if (user.username.isNotEmpty) {
        await secureStorage.saveUsername(user.username);
      }

      return Right(user);
    } on AuthException catch (e) {
      // Clear invalid credentials
      await secureStorage.clearAuth();
      return Left(AuthFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      await secureStorage.clearAuth();
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> getCurrentUser() async {
    try {
      final username = await secureStorage.getUsername();
      if (username == null) {
        return const Left(AuthFailure(message: 'No user logged in'));
      }

      final user = await remoteDataSource.validateSession(username);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } on NetworkException catch (e) {
      // Offline - return cached user info
      final username = await secureStorage.getUsername();
      if (username != null) {
        return Right(AuthUser(username: username));
      }
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await secureStorage.clearAuth();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to logout: $e'));
    }
  }

  @override
  Future<bool> isAuthenticated() => secureStorage.isAuthenticated;
}
