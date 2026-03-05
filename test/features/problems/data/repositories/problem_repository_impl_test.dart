import 'package:code_forge/core/errors/exceptions.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/core/network/network_info.dart';
import 'package:code_forge/features/problems/data/datasources/problem_local_data_source.dart';
import 'package:code_forge/features/problems/data/datasources/problem_remote_data_source.dart';
import 'package:code_forge/features/problems/data/repositories/problem_repository_impl.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/entities/problem_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProblemLocalDataSource extends Mock
    implements ProblemLocalDataSource {}

class MockProblemRemoteDataSource extends Mock
    implements ProblemRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProblemRepositoryImpl repository;
  late MockProblemLocalDataSource mockLocal;
  late MockProblemRemoteDataSource mockRemote;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocal = MockProblemLocalDataSource();
    mockRemote = MockProblemRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProblemRepositoryImpl(
      localDataSource: mockLocal,
      remoteDataSource: mockRemote,
      networkInfo: mockNetworkInfo,
    );
  });

  setUpAll(() {
    registerFallbackValue(const ProblemFilter());
    registerFallbackValue(<Problem>[]);
  });

  const tFilter = ProblemFilter();
  const tProblem = Problem(
    id: 1,
    frontendId: '1',
    title: 'Two Sum',
    titleSlug: 'two-sum',
    difficulty: 'Easy',
    acRate: 52.3,
    isPaidOnly: false,
  );
  const tProblemWithContent = Problem(
    id: 1,
    frontendId: '1',
    title: 'Two Sum',
    titleSlug: 'two-sum',
    difficulty: 'Easy',
    content: '<p>Given an array...</p>',
    acRate: 52.3,
    isPaidOnly: false,
  );

  group('getProblems', () {
    test('returns problems from local data source', () async {
      when(
        () => mockLocal.getProblems(any()),
      ).thenAnswer((_) async => [tProblem]);

      final result = await repository.getProblems(tFilter);

      expect(result, isA<Right>());
      result.fold(
        (_) => fail('Should be Right'),
        (problems) => expect(problems, [tProblem]),
      );
      verify(() => mockLocal.getProblems(tFilter)).called(1);
    });

    test('returns CacheFailure on CacheException', () async {
      when(
        () => mockLocal.getProblems(any()),
      ).thenThrow(const CacheException(message: 'DB error'));

      final result = await repository.getProblems(tFilter);

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<CacheFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });

  group('getProblemsCount', () {
    test('returns count from local data source', () async {
      when(
        () => mockLocal.getProblemsCount(any()),
      ).thenAnswer((_) async => 100);

      final result = await repository.getProblemsCount(tFilter);

      expect(result, const Right(100));
    });
  });

  group('getProblemDetail', () {
    test('returns local problem when content is available', () async {
      when(
        () => mockLocal.getProblemBySlug('two-sum'),
      ).thenAnswer((_) async => tProblemWithContent);

      final result = await repository.getProblemDetail('two-sum');

      expect(result, const Right(tProblemWithContent));
      verifyNever(() => mockRemote.getProblemDetail(any()));
    });

    test('fetches from remote when local has no content', () async {
      when(
        () => mockLocal.getProblemBySlug('two-sum'),
      ).thenAnswer((_) async => tProblem);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemote.getProblemDetail('two-sum'),
      ).thenAnswer((_) async => tProblemWithContent);
      when(() => mockLocal.saveProblems(any())).thenAnswer((_) async {});
      when(
        () => mockLocal.saveCodeSnippets(any(), any()),
      ).thenAnswer((_) async {});

      final result = await repository.getProblemDetail('two-sum');

      expect(result, const Right(tProblemWithContent));
      verify(() => mockRemote.getProblemDetail('two-sum')).called(1);
      verify(() => mockLocal.saveProblems([tProblemWithContent])).called(1);
    });

    test('returns local problem when offline and no content', () async {
      when(
        () => mockLocal.getProblemBySlug('two-sum'),
      ).thenAnswer((_) async => tProblem);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.getProblemDetail('two-sum');

      expect(result, const Right(tProblem));
    });

    test('returns CacheFailure when problem not found and offline', () async {
      when(
        () => mockLocal.getProblemBySlug('unknown'),
      ).thenAnswer((_) async => null);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.getProblemDetail('unknown');

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<CacheFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('returns AuthFailure on AuthException and no local data', () async {
      when(
        () => mockLocal.getProblemBySlug('two-sum'),
      ).thenAnswer((_) async => null);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemote.getProblemDetail('two-sum'),
      ).thenThrow(const AuthException(message: 'Auth required'));

      final result = await repository.getProblemDetail('two-sum');

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });

  group('getAllTags', () {
    test('returns tags from local data source', () async {
      const tTags = [TopicTag(id: '1', name: 'Array', slug: 'array')];
      when(() => mockLocal.getAllTags()).thenAnswer((_) async => tTags);

      final result = await repository.getAllTags();

      expect(result, const Right(tTags));
    });
  });

  group('seedProblemsFromJson', () {
    test('seeds when no problems exist', () async {
      when(() => mockLocal.hasProblems()).thenAnswer((_) async => false);
      when(() => mockLocal.seedFromJson()).thenAnswer((_) async {});

      final result = await repository.seedProblemsFromJson();

      expect(result, const Right(null));
      verify(() => mockLocal.seedFromJson()).called(1);
    });

    test('skips seeding when problems already exist', () async {
      when(() => mockLocal.hasProblems()).thenAnswer((_) async => true);

      final result = await repository.seedProblemsFromJson();

      expect(result, const Right(null));
      verifyNever(() => mockLocal.seedFromJson());
    });
  });

  group('syncProblemsFromRemote', () {
    test('returns NetworkFailure when offline', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.syncProblemsFromRemote();

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });
}
