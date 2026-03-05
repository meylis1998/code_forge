import 'package:code_forge/core/errors/exceptions.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/core/storage/secure_storage_helper.dart';
import 'package:code_forge/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:code_forge/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:code_forge/features/auth/domain/entities/auth_state_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockSecureStorageHelper extends Mock implements SecureStorageHelper {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockSecureStorageHelper mockSecureStorage;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockSecureStorage = MockSecureStorageHelper();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      secureStorage: mockSecureStorage,
    );
  });

  const tUser = AuthUser(username: 'testuser', realName: 'Test');

  group('getCurrentUser', () {
    test(
      'should return AuthUser when username exists and session is valid',
      () async {
        when(
          () => mockSecureStorage.getUsername(),
        ).thenAnswer((_) async => 'testuser');
        when(
          () => mockRemoteDataSource.validateSession('testuser'),
        ).thenAnswer((_) async => tUser);

        final result = await repository.getCurrentUser();

        expect(result, const Right(tUser));
      },
    );

    test('should return AuthFailure when no username is stored', () async {
      when(() => mockSecureStorage.getUsername()).thenAnswer((_) async => null);

      final result = await repository.getCurrentUser();

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('should return cached user on NetworkException', () async {
      when(
        () => mockSecureStorage.getUsername(),
      ).thenAnswer((_) async => 'testuser');
      when(
        () => mockRemoteDataSource.validateSession('testuser'),
      ).thenThrow(const NetworkException(message: 'No internet'));

      final result = await repository.getCurrentUser();

      expect(result, isA<Right>());
      result.fold(
        (_) => fail('Should be Right'),
        (user) => expect(user.username, 'testuser'),
      );
    });
  });

  group('logout', () {
    test('should clear auth and return Right', () async {
      when(() => mockSecureStorage.clearAuth()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, const Right(null));
      verify(() => mockSecureStorage.clearAuth()).called(1);
    });
  });

  group('isAuthenticated', () {
    test('should delegate to secureStorage', () async {
      when(
        () => mockSecureStorage.isAuthenticated,
      ).thenAnswer((_) async => true);

      final result = await repository.isAuthenticated();

      expect(result, true);
    });
  });
}
