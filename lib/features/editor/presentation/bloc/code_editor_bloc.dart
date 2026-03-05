import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../problems/domain/entities/problem_entity.dart';
import '../../../problems/domain/usecases/get_problem_detail_usecase.dart';

part 'code_editor_event.dart';
part 'code_editor_state.dart';

class CodeEditorBloc extends Bloc<CodeEditorEvent, CodeEditorState> {
  CodeEditorBloc({
    required GetProblemDetailUseCase getProblemDetail,
  })  : _getProblemDetail = getProblemDetail,
        super(const CodeEditorState()) {
    on<CodeEditorLoadProblem>(_onLoadProblem);
    on<CodeEditorLanguageChanged>(_onLanguageChanged);
    on<CodeEditorCodeChanged>(_onCodeChanged);
    on<CodeEditorResetCode>(_onResetCode);
    on<CodeEditorTestCaseChanged>(_onTestCaseChanged);
  }

  final GetProblemDetailUseCase _getProblemDetail;

  Future<void> _onLoadProblem(
    CodeEditorLoadProblem event,
    Emitter<CodeEditorState> emit,
  ) async {
    emit(state.copyWith(status: CodeEditorStatus.loading));

    final result = await _getProblemDetail(event.titleSlug);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CodeEditorStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (problem) {
        final defaultLang = AppConstants.defaultLanguage;
        final snippet = problem.codeSnippets.isNotEmpty
            ? problem.codeSnippets.firstWhere(
                (s) => s.langSlug == defaultLang,
                orElse: () => problem.codeSnippets.first,
              )
            : null;

        emit(
          state.copyWith(
            status: CodeEditorStatus.loaded,
            problem: problem,
            selectedLanguage: snippet?.langSlug ?? defaultLang,
            code: snippet?.code ?? '',
            originalCode: snippet?.code ?? '',
            testCases: problem.sampleTestCase ?? problem.exampleTestcases ?? '',
          ),
        );
      },
    );
  }

  void _onLanguageChanged(
    CodeEditorLanguageChanged event,
    Emitter<CodeEditorState> emit,
  ) {
    final problem = state.problem;
    if (problem == null) return;

    final snippet = problem.codeSnippets.firstWhere(
      (s) => s.langSlug == event.language,
      orElse: () => CodeSnippet(
        lang: event.language,
        langSlug: event.language,
        code: '',
      ),
    );

    // Save draft of current language
    final drafts = Map<String, String>.from(state.codeDrafts);
    drafts[state.selectedLanguage] = state.code;

    // Restore draft or use snippet
    final code = drafts[event.language] ?? snippet.code;

    emit(
      state.copyWith(
        selectedLanguage: event.language,
        code: code,
        originalCode: snippet.code,
        codeDrafts: drafts,
      ),
    );
  }

  void _onCodeChanged(
    CodeEditorCodeChanged event,
    Emitter<CodeEditorState> emit,
  ) {
    emit(state.copyWith(code: event.code));
  }

  void _onResetCode(
    CodeEditorResetCode event,
    Emitter<CodeEditorState> emit,
  ) {
    emit(state.copyWith(code: state.originalCode));
  }

  void _onTestCaseChanged(
    CodeEditorTestCaseChanged event,
    Emitter<CodeEditorState> emit,
  ) {
    emit(state.copyWith(testCases: event.testCases));
  }
}
