import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/errors/exceptions.dart';
import 'package:code_forge/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:code_forge/features/dashboard/domain/entities/user_stats.dart';
import 'package:code_forge/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRemoteDataSource extends Mock
    implements DashboardRemoteDataSource {}

void main() {
  late DashboardBloc bloc;
  late MockDashboardRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockDashboardRemoteDataSource();
    bloc = DashboardBloc(remoteDataSource: mockDataSource);
  });

  tearDown(() => bloc.close());

  const tStats = UserStats(
    username: 'testuser',
    easySolved: 50,
    mediumSolved: 30,
    hardSolved: 10,
    totalSolved: 90,
    totalQuestions: 3000,
    streak: 7,
    totalActiveDays: 120,
  );

  const tDailyChallenge = DailyChallenge(
    date: '2024-01-01',
    questionId: '1',
    frontendId: '1',
    title: 'Two Sum',
    titleSlug: 'two-sum',
    difficulty: 'Easy',
    acRate: 52.3,
  );

  test('initial state is correct', () {
    expect(bloc.state.status, DashboardStatus.initial);
    expect(bloc.state.stats, isNull);
  });

  group('DashboardLoaded', () {
    blocTest<DashboardBloc, DashboardState>(
      'emits [loading, loaded] with stats and daily challenge',
      build: () {
        when(() => mockDataSource.getUserStats('testuser'))
            .thenAnswer((_) async => tStats);
        when(() => mockDataSource.getDailyChallenge())
            .thenAnswer((_) async => tDailyChallenge);
        return bloc;
      },
      act: (bloc) => bloc.add(const DashboardLoaded('testuser')),
      expect: () => [
        const DashboardState(status: DashboardStatus.loading),
        const DashboardState(
          status: DashboardStatus.loaded,
          stats: tStats,
          dailyChallenge: tDailyChallenge,
        ),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'emits [loading, unauthenticated] on AuthException',
      build: () {
        when(() => mockDataSource.getUserStats('testuser'))
            .thenThrow(const AuthException(message: 'Session expired'));
        return bloc;
      },
      act: (bloc) => bloc.add(const DashboardLoaded('testuser')),
      expect: () => [
        const DashboardState(status: DashboardStatus.loading),
        const DashboardState(status: DashboardStatus.unauthenticated),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'emits [loading, error] on generic exception',
      build: () {
        when(() => mockDataSource.getUserStats('testuser'))
            .thenThrow(Exception('Network error'));
        return bloc;
      },
      act: (bloc) => bloc.add(const DashboardLoaded('testuser')),
      expect: () => [
        const DashboardState(status: DashboardStatus.loading),
        isA<DashboardState>()
            .having((s) => s.status, 'status', DashboardStatus.error)
            .having(
              (s) => s.errorMessage,
              'error',
              contains('Network error'),
            ),
      ],
    );
  });

  group('DashboardRefreshed', () {
    blocTest<DashboardBloc, DashboardState>(
      'does nothing when stats is null',
      build: () => bloc,
      act: (bloc) => bloc.add(DashboardRefreshed()),
      expect: () => <DashboardState>[],
    );

    blocTest<DashboardBloc, DashboardState>(
      'reloads stats when stats exist',
      build: () {
        when(() => mockDataSource.getUserStats('testuser'))
            .thenAnswer((_) async => tStats);
        when(() => mockDataSource.getDailyChallenge())
            .thenAnswer((_) async => tDailyChallenge);
        return bloc;
      },
      seed: () => const DashboardState(
        status: DashboardStatus.loaded,
        stats: tStats,
      ),
      act: (bloc) => bloc.add(DashboardRefreshed()),
      expect: () => [
        isA<DashboardState>()
            .having((s) => s.status, 'status', DashboardStatus.loading),
        isA<DashboardState>()
            .having((s) => s.status, 'status', DashboardStatus.loaded),
      ],
    );
  });

  group('UserStats entity', () {
    test('solveRate returns correct ratio', () {
      expect(tStats.solveRate, closeTo(0.03, 0.01));
    });

    test('solveRate returns 0 when totalQuestions is 0', () {
      const emptyStats = UserStats(username: 'user');
      expect(emptyStats.solveRate, 0);
    });
  });
}
