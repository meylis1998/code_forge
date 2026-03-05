import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/code_execution_result.dart';
import '../../domain/repositories/code_execution_repository.dart';

part 'code_execution_event.dart';
part 'code_execution_state.dart';

class CodeExecutionBloc extends Bloc<CodeExecutionEvent, CodeExecutionState> {
  CodeExecutionBloc({
    required CodeExecutionRepository repository,
  }) : _repository = repository,
       super(const CodeExecutionState()) {
    on<CodeExecutionRunRequested>(_onRunCode);
    on<CodeExecutionSubmitRequested>(_onSubmitCode);
    on<CodeExecutionReset>(_onReset);
  }

  final CodeExecutionRepository _repository;

  Future<void> _onRunCode(
    CodeExecutionRunRequested event,
    Emitter<CodeExecutionState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CodeExecutionStatus.running,
        result: null,
        errorMessage: null,
      ),
    );

    final result = await _repository.runCode(
      titleSlug: event.titleSlug,
      code: event.code,
      language: event.language,
      testCases: event.testCases,
      questionId: event.questionId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CodeExecutionStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (executionResult) => emit(
        state.copyWith(
          status: CodeExecutionStatus.completed,
          result: executionResult,
        ),
      ),
    );
  }

  Future<void> _onSubmitCode(
    CodeExecutionSubmitRequested event,
    Emitter<CodeExecutionState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CodeExecutionStatus.submitting,
        result: null,
        errorMessage: null,
      ),
    );

    final result = await _repository.submitCode(
      titleSlug: event.titleSlug,
      code: event.code,
      language: event.language,
      questionId: event.questionId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CodeExecutionStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (executionResult) => emit(
        state.copyWith(
          status: CodeExecutionStatus.completed,
          result: executionResult,
        ),
      ),
    );
  }

  void _onReset(
    CodeExecutionReset event,
    Emitter<CodeExecutionState> emit,
  ) {
    emit(const CodeExecutionState());
  }
}
