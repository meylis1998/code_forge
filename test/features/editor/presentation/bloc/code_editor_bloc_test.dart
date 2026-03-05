import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/core/database/daos/code_template_dao.dart';
import 'package:code_forge/features/problems/domain/usecases/get_problem_detail_usecase.dart';
import 'package:code_forge/features/editor/presentation/bloc/code_editor_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProblemDetailUseCase extends Mock
    implements GetProblemDetailUseCase {}

class MockCodeTemplateDao extends Mock implements CodeTemplateDao {}

void main() {
  late CodeEditorBloc bloc;
  late MockGetProblemDetailUseCase mockGetProblemDetail;
  late MockCodeTemplateDao mockCodeTemplateDao;

  setUp(() {
    mockGetProblemDetail = MockGetProblemDetailUseCase();
    mockCodeTemplateDao = MockCodeTemplateDao();
    when(
      () => mockCodeTemplateDao.getTemplate(any()),
    ).thenAnswer((_) async => null);
    bloc = CodeEditorBloc(
      getProblemDetail: mockGetProblemDetail,
      codeTemplateDao: mockCodeTemplateDao,
    );
  });

  tearDown(() => bloc.close());

  const tProblem = Problem(
    id: 1,
    frontendId: '1',
    title: 'Two Sum',
    titleSlug: 'two-sum',
    difficulty: 'Easy',
    content: '<p>Given an array...</p>',
    sampleTestCase: '[2,7,11,15]\n9',
    codeSnippets: [
      CodeSnippet(
        lang: 'Python3',
        langSlug: 'python3',
        code:
            'class Solution:\n    def twoSum(self, nums, target):\n        pass',
      ),
      CodeSnippet(
        lang: 'C++',
        langSlug: 'cpp',
        code: 'class Solution {\npublic:\n};',
      ),
    ],
  );

  test('initial state is correct', () {
    expect(bloc.state, const CodeEditorState());
    expect(bloc.state.status, CodeEditorStatus.initial);
  });

  group('CodeEditorLoadProblem', () {
    blocTest<CodeEditorBloc, CodeEditorState>(
      'emits [loading, loaded] with problem data on success',
      build: () {
        when(
          () => mockGetProblemDetail(any()),
        ).thenAnswer((_) async => const Right(tProblem));
        return bloc;
      },
      act: (bloc) => bloc.add(const CodeEditorLoadProblem('two-sum')),
      expect: () => [
        const CodeEditorState(status: CodeEditorStatus.loading),
        isA<CodeEditorState>()
            .having((s) => s.status, 'status', CodeEditorStatus.loaded)
            .having((s) => s.problem, 'problem', tProblem)
            .having(
              (s) => s.selectedLanguage,
              'selectedLanguage',
              'python3',
            )
            .having(
              (s) => s.testCases,
              'testCases',
              '[2,7,11,15]\n9',
            ),
      ],
    );

    blocTest<CodeEditorBloc, CodeEditorState>(
      'emits [loading, error] on failure',
      build: () {
        when(() => mockGetProblemDetail(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'Not found')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const CodeEditorLoadProblem('two-sum')),
      expect: () => [
        const CodeEditorState(status: CodeEditorStatus.loading),
        const CodeEditorState(
          status: CodeEditorStatus.error,
          errorMessage: 'Not found',
        ),
      ],
    );
  });

  group('CodeEditorCodeChanged', () {
    blocTest<CodeEditorBloc, CodeEditorState>(
      'updates code in state',
      build: () => bloc,
      seed: () => const CodeEditorState(
        status: CodeEditorStatus.loaded,
        code: 'original',
        originalCode: 'original',
      ),
      act: (bloc) => bloc.add(const CodeEditorCodeChanged('modified')),
      expect: () => [
        const CodeEditorState(
          status: CodeEditorStatus.loaded,
          code: 'modified',
          originalCode: 'original',
        ),
      ],
    );
  });

  group('CodeEditorResetCode', () {
    blocTest<CodeEditorBloc, CodeEditorState>(
      'resets code to original',
      build: () => bloc,
      seed: () => const CodeEditorState(
        status: CodeEditorStatus.loaded,
        code: 'modified',
        originalCode: 'original',
      ),
      act: (bloc) => bloc.add(CodeEditorResetCode()),
      expect: () => [
        const CodeEditorState(
          status: CodeEditorStatus.loaded,
          code: 'original',
          originalCode: 'original',
        ),
      ],
    );
  });

  group('CodeEditorLanguageChanged', () {
    blocTest<CodeEditorBloc, CodeEditorState>(
      'switches language and saves draft',
      build: () => bloc,
      seed: () => const CodeEditorState(
        status: CodeEditorStatus.loaded,
        problem: tProblem,
        selectedLanguage: 'python3',
        code: 'my python code',
        originalCode: 'class Solution:',
      ),
      act: (bloc) => bloc.add(const CodeEditorLanguageChanged('cpp')),
      expect: () => [
        isA<CodeEditorState>()
            .having((s) => s.selectedLanguage, 'language', 'cpp')
            .having(
              (s) => s.codeDrafts['python3'],
              'python3 draft saved',
              'my python code',
            ),
      ],
    );
  });

  group('CodeEditorTestCaseChanged', () {
    blocTest<CodeEditorBloc, CodeEditorState>(
      'updates test cases',
      build: () => bloc,
      seed: () => const CodeEditorState(
        status: CodeEditorStatus.loaded,
        testCases: 'old',
      ),
      act: (bloc) => bloc.add(const CodeEditorTestCaseChanged('new cases')),
      expect: () => [
        const CodeEditorState(
          status: CodeEditorStatus.loaded,
          testCases: 'new cases',
        ),
      ],
    );
  });

  group('hasUnsavedChanges', () {
    test('returns true when code differs from original', () {
      const state = CodeEditorState(
        code: 'modified',
        originalCode: 'original',
      );
      expect(state.hasUnsavedChanges, true);
    });

    test('returns false when code matches original', () {
      const state = CodeEditorState(
        code: 'same',
        originalCode: 'same',
      );
      expect(state.hasUnsavedChanges, false);
    });
  });
}
