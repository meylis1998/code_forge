import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/database/app_database.dart';
import 'package:code_forge/core/database/daos/submission_dao.dart';
import 'package:code_forge/features/submissions/presentation/bloc/submissions_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubmissionDao extends Mock implements SubmissionDao {}

void main() {
  late SubmissionsBloc bloc;
  late MockSubmissionDao mockSubmissionDao;

  setUp(() {
    mockSubmissionDao = MockSubmissionDao();
    bloc = SubmissionsBloc(submissionDao: mockSubmissionDao);
  });

  tearDown(() => bloc.close());

  final tSubmissions = [
    SubmissionsTableData(
      id: 1,
      problemId: 1,
      titleSlug: 'two-sum',
      title: 'Two Sum',
      lang: 'python3',
      code: 'class Solution:...',
      statusDisplay: 'Accepted',
      statusCode: 10,
      runtime: '40 ms',
      memory: '16.5 MB',
      timestamp: 1700000000,
      createdAt: DateTime.now(),
    ),
    SubmissionsTableData(
      id: 2,
      problemId: 2,
      titleSlug: 'add-two-numbers',
      title: 'Add Two Numbers',
      lang: 'python3',
      code: 'class Solution:...',
      statusDisplay: 'Wrong Answer',
      statusCode: 11,
      timestamp: 1700000100,
      createdAt: DateTime.now(),
    ),
  ];

  test('initial state is correct', () {
    expect(bloc.state.status, SubmissionsStatus.initial);
    expect(bloc.state.submissions, isEmpty);
    expect(bloc.state.hasReachedMax, false);
  });

  group('SubmissionsLoaded', () {
    blocTest<SubmissionsBloc, SubmissionsState>(
      'emits [loading, loaded] with submissions on success',
      build: () {
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            lang: null,
            statusDisplay: null,
          ),
        ).thenAnswer((_) async => tSubmissions);
        return bloc;
      },
      act: (bloc) => bloc.add(SubmissionsLoaded()),
      expect: () => [
        const SubmissionsState(status: SubmissionsStatus.loading),
        isA<SubmissionsState>()
            .having((s) => s.status, 'status', SubmissionsStatus.loaded)
            .having((s) => s.submissions.length, 'count', 2)
            .having((s) => s.hasReachedMax, 'hasReachedMax', true),
      ],
    );

    blocTest<SubmissionsBloc, SubmissionsState>(
      'emits [loading, error] on failure',
      build: () {
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            lang: null,
            statusDisplay: null,
          ),
        ).thenThrow(Exception('DB error'));
        return bloc;
      },
      act: (bloc) => bloc.add(SubmissionsLoaded()),
      expect: () => [
        const SubmissionsState(status: SubmissionsStatus.loading),
        isA<SubmissionsState>().having(
          (s) => s.status,
          'status',
          SubmissionsStatus.error,
        ),
      ],
    );

    blocTest<SubmissionsBloc, SubmissionsState>(
      'sets hasReachedMax to false when 20 or more submissions returned',
      build: () {
        final manySubmissions = List.generate(
          20,
          (i) => SubmissionsTableData(
            id: i,
            problemId: i,
            titleSlug: 'problem-$i',
            title: 'Problem $i',
            lang: 'python3',
            code: 'code',
            statusDisplay: 'Accepted',
            timestamp: 1700000000 + i,
            createdAt: DateTime.now(),
          ),
        );
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            lang: null,
            statusDisplay: null,
          ),
        ).thenAnswer((_) async => manySubmissions);
        return bloc;
      },
      act: (bloc) => bloc.add(SubmissionsLoaded()),
      expect: () => [
        const SubmissionsState(status: SubmissionsStatus.loading),
        isA<SubmissionsState>().having(
          (s) => s.hasReachedMax,
          'hasReachedMax',
          false,
        ),
      ],
    );
  });

  group('SubmissionsLoadMore', () {
    blocTest<SubmissionsBloc, SubmissionsState>(
      'does nothing when hasReachedMax is true',
      build: () => bloc,
      seed: () => const SubmissionsState(
        status: SubmissionsStatus.loaded,
        hasReachedMax: true,
      ),
      act: (bloc) => bloc.add(SubmissionsLoadMore()),
      expect: () => <SubmissionsState>[],
    );

    blocTest<SubmissionsBloc, SubmissionsState>(
      'appends new submissions when hasReachedMax is false',
      build: () {
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            offset: 2,
            lang: null,
            statusDisplay: null,
          ),
        ).thenAnswer((_) async => [tSubmissions.first]);
        return bloc;
      },
      seed: () => SubmissionsState(
        status: SubmissionsStatus.loaded,
        submissions: tSubmissions,
      ),
      act: (bloc) => bloc.add(SubmissionsLoadMore()),
      expect: () => [
        isA<SubmissionsState>()
            .having((s) => s.submissions.length, 'count', 3)
            .having((s) => s.hasReachedMax, 'hasReachedMax', true),
      ],
    );
  });

  group('SubmissionsFilterChanged', () {
    blocTest<SubmissionsBloc, SubmissionsState>(
      'fetches submissions with language filter',
      build: () {
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            lang: 'python3',
            statusDisplay: null,
          ),
        ).thenAnswer((_) async => [tSubmissions.first]);
        return bloc;
      },
      act: (bloc) => bloc.add(const SubmissionsFilterChanged(lang: 'python3')),
      expect: () => [
        isA<SubmissionsState>()
            .having((s) => s.status, 'status', SubmissionsStatus.loading)
            .having((s) => s.langFilter, 'langFilter', 'python3'),
        isA<SubmissionsState>()
            .having((s) => s.status, 'status', SubmissionsStatus.loaded)
            .having((s) => s.submissions.length, 'count', 1),
      ],
    );

    blocTest<SubmissionsBloc, SubmissionsState>(
      'fetches submissions with status filter',
      build: () {
        when(
          () => mockSubmissionDao.getSubmissions(
            limit: 20,
            lang: null,
            statusDisplay: 'Accepted',
          ),
        ).thenAnswer((_) async => [tSubmissions.first]);
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const SubmissionsFilterChanged(status: 'Accepted')),
      expect: () => [
        isA<SubmissionsState>()
            .having((s) => s.status, 'status', SubmissionsStatus.loading)
            .having((s) => s.statusFilter, 'statusFilter', 'Accepted'),
        isA<SubmissionsState>().having(
          (s) => s.status,
          'status',
          SubmissionsStatus.loaded,
        ),
      ],
    );
  });
}
