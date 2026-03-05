import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/editor/domain/entities/code_execution_result.dart';
import 'package:code_forge/features/editor/domain/repositories/code_execution_repository.dart';
import 'package:code_forge/features/editor/presentation/bloc/code_execution_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCodeExecutionRepository extends Mock
    implements CodeExecutionRepository {}

void main() {
  late CodeExecutionBloc bloc;
  late MockCodeExecutionRepository mockRepository;

  setUp(() {
    mockRepository = MockCodeExecutionRepository();
    bloc = CodeExecutionBloc(repository: mockRepository);
  });

  tearDown(() => bloc.close());

  const tResult = CodeExecutionResult(
    state: 'SUCCESS',
    statusCode: 10,
    statusMessage: 'Accepted',
    statusRuntime: '32 ms',
    statusMemory: '14.2 MB',
    totalCorrect: 3,
    totalTestcases: 3,
  );

  test('initial state is idle', () {
    expect(bloc.state.status, CodeExecutionStatus.idle);
    expect(bloc.state.result, isNull);
  });

  group('CodeExecutionRunRequested', () {
    blocTest<CodeExecutionBloc, CodeExecutionState>(
      'emits [running, completed] with result on success',
      build: () {
        when(
          () => mockRepository.runCode(
            titleSlug: any(named: 'titleSlug'),
            code: any(named: 'code'),
            language: any(named: 'language'),
            testCases: any(named: 'testCases'),
            questionId: any(named: 'questionId'),
          ),
        ).thenAnswer((_) async => const Right(tResult));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const CodeExecutionRunRequested(
          titleSlug: 'two-sum',
          code: 'def twoSum(): pass',
          language: 'python3',
          testCases: '[2,7]\n9',
          questionId: '1',
        ),
      ),
      expect: () => [
        isA<CodeExecutionState>().having(
          (s) => s.status,
          'status',
          CodeExecutionStatus.running,
        ),
        isA<CodeExecutionState>()
            .having((s) => s.status, 'status', CodeExecutionStatus.completed)
            .having((s) => s.result, 'result', tResult),
      ],
    );

    blocTest<CodeExecutionBloc, CodeExecutionState>(
      'emits [running, error] on failure',
      build: () {
        when(
          () => mockRepository.runCode(
            titleSlug: any(named: 'titleSlug'),
            code: any(named: 'code'),
            language: any(named: 'language'),
            testCases: any(named: 'testCases'),
            questionId: any(named: 'questionId'),
          ),
        ).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'Timeout')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const CodeExecutionRunRequested(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          testCases: 'test',
          questionId: '1',
        ),
      ),
      expect: () => [
        isA<CodeExecutionState>().having(
          (s) => s.status,
          'status',
          CodeExecutionStatus.running,
        ),
        isA<CodeExecutionState>()
            .having((s) => s.status, 'status', CodeExecutionStatus.error)
            .having((s) => s.errorMessage, 'errorMessage', 'Timeout'),
      ],
    );
  });

  group('CodeExecutionSubmitRequested', () {
    blocTest<CodeExecutionBloc, CodeExecutionState>(
      'emits [submitting, completed] on success',
      build: () {
        when(
          () => mockRepository.submitCode(
            titleSlug: any(named: 'titleSlug'),
            code: any(named: 'code'),
            language: any(named: 'language'),
            questionId: any(named: 'questionId'),
          ),
        ).thenAnswer((_) async => const Right(tResult));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const CodeExecutionSubmitRequested(
          titleSlug: 'two-sum',
          code: 'code',
          language: 'python3',
          questionId: '1',
        ),
      ),
      expect: () => [
        isA<CodeExecutionState>().having(
          (s) => s.status,
          'status',
          CodeExecutionStatus.submitting,
        ),
        isA<CodeExecutionState>()
            .having((s) => s.status, 'status', CodeExecutionStatus.completed)
            .having((s) => s.result, 'result', tResult),
      ],
    );
  });

  group('CodeExecutionReset', () {
    blocTest<CodeExecutionBloc, CodeExecutionState>(
      'resets to initial state',
      build: () => bloc,
      seed: () => const CodeExecutionState(
        status: CodeExecutionStatus.completed,
        result: tResult,
      ),
      act: (bloc) => bloc.add(CodeExecutionReset()),
      expect: () => [const CodeExecutionState()],
    );
  });

  group('isProcessing', () {
    test('returns true when running', () {
      const state = CodeExecutionState(status: CodeExecutionStatus.running);
      expect(state.isProcessing, true);
    });

    test('returns true when submitting', () {
      const state = CodeExecutionState(status: CodeExecutionStatus.submitting);
      expect(state.isProcessing, true);
    });

    test('returns false when idle', () {
      const state = CodeExecutionState();
      expect(state.isProcessing, false);
    });
  });
}
