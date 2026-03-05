import 'package:code_forge/core/database/app_database.dart';
import 'package:code_forge/core/database/daos/submission_dao.dart';
import 'package:code_forge/core/errors/exceptions.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/core/network/leetcode_api_client.dart';
import 'package:code_forge/features/editor/data/repositories/code_execution_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLeetCodeApiClient extends Mock implements LeetCodeApiClient {}

class MockSubmissionDao extends Mock implements SubmissionDao {}

class FakeSubmissionsTableCompanion extends Fake
    implements SubmissionsTableCompanion {}

void main() {
  late CodeExecutionRepositoryImpl repository;
  late MockLeetCodeApiClient mockApiClient;
  late MockSubmissionDao mockSubmissionDao;

  setUp(() {
    mockApiClient = MockLeetCodeApiClient();
    mockSubmissionDao = MockSubmissionDao();
    repository = CodeExecutionRepositoryImpl(
      apiClient: mockApiClient,
      submissionDao: mockSubmissionDao,
    );
  });

  setUpAll(() {
    registerFallbackValue(FakeSubmissionsTableCompanion());
  });

  group('runCode', () {
    test('returns CodeExecutionResult on success', () async {
      when(
        () => mockApiClient.runCode(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          testCases: '[2,7,11,15]\n9',
          questionId: '1',
        ),
      ).thenAnswer((_) async => {'interpret_id': 'interp_123'});

      when(() => mockApiClient.pollSubmissionResult('interp_123')).thenAnswer(
        (_) async => {
          'state': 'SUCCESS',
          'status_code': 10,
          'status_msg': 'Accepted',
          'status_runtime': '40 ms',
          'status_memory': '16.5 MB',
          'total_correct': 3,
          'total_testcases': 3,
        },
      );

      final result = await repository.runCode(
        titleSlug: 'two-sum',
        code: 'code',
        language: 'python3',
        testCases: '[2,7,11,15]\n9',
        questionId: '1',
      );

      expect(result, isA<Right>());
      result.fold(
        (_) => fail('Should be Right'),
        (r) {
          expect(r.isAccepted, true);
          expect(r.statusRuntime, '40 ms');
          expect(r.totalCorrect, 3);
        },
      );
    });

    test('returns ServerFailure when no interpret_id', () async {
      when(
        () => mockApiClient.runCode(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          testCases: 'test',
          questionId: '1',
        ),
      ).thenAnswer((_) async => {});

      final result = await repository.runCode(
        titleSlug: 'two-sum',
        code: 'code',
        language: 'python3',
        testCases: 'test',
        questionId: '1',
      );

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('returns AuthFailure on AuthException', () async {
      when(
        () => mockApiClient.runCode(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          testCases: 'test',
          questionId: '1',
        ),
      ).thenThrow(const AuthException(message: 'Session expired'));

      final result = await repository.runCode(
        titleSlug: 'two-sum',
        code: 'code',
        language: 'python3',
        testCases: 'test',
        questionId: '1',
      );

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (_) => fail('Should be Left'),
      );
    });

    test('returns NetworkFailure on NetworkException', () async {
      when(
        () => mockApiClient.runCode(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          testCases: 'test',
          questionId: '1',
        ),
      ).thenThrow(const NetworkException(message: 'No internet'));

      final result = await repository.runCode(
        titleSlug: 'two-sum',
        code: 'code',
        language: 'python3',
        testCases: 'test',
        questionId: '1',
      );

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });

  group('submitCode', () {
    test(
      'returns CodeExecutionResult and saves submission on success',
      () async {
        when(
          () => mockApiClient.submitSolution(
            titleSlug: 'two-sum',
            code: 'code',
            language: 'python3',
            questionId: '1',
          ),
        ).thenAnswer((_) async => {'submission_id': 12345});

        when(() => mockApiClient.pollSubmissionResult('12345')).thenAnswer(
          (_) async => {
            'state': 'SUCCESS',
            'status_code': 10,
            'status_msg': 'Accepted',
            'status_runtime': '40 ms',
            'status_memory': '16.5 MB',
          },
        );

        when(
          () => mockSubmissionDao.insertSubmission(any()),
        ).thenAnswer((_) async {});

        final result = await repository.submitCode(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          questionId: '1',
        );

        expect(result, isA<Right>());
        result.fold(
          (_) => fail('Should be Right'),
          (r) {
            expect(r.isAccepted, true);
            expect(r.submissionId, '12345');
          },
        );
        verify(() => mockSubmissionDao.insertSubmission(any())).called(1);
      },
    );

    test('returns ServerFailure when no submission_id', () async {
      when(
        () => mockApiClient.submitSolution(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          questionId: '1',
        ),
      ).thenAnswer((_) async => {});

      final result = await repository.submitCode(
        titleSlug: 'two-sum',
        code: 'code',
        language: 'python3',
        questionId: '1',
      );

      expect(result, isA<Left>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should be Left'),
      );
    });
  });
}
