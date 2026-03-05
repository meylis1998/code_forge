part of 'code_execution_bloc.dart';

enum CodeExecutionStatus { idle, running, submitting, completed, error }

class CodeExecutionState extends Equatable {
  const CodeExecutionState({
    this.status = CodeExecutionStatus.idle,
    this.result,
    this.errorMessage,
  });

  final CodeExecutionStatus status;
  final CodeExecutionResult? result;
  final String? errorMessage;

  bool get isProcessing =>
      status == CodeExecutionStatus.running ||
      status == CodeExecutionStatus.submitting;

  CodeExecutionState copyWith({
    CodeExecutionStatus? status,
    CodeExecutionResult? result,
    String? errorMessage,
  }) {
    return CodeExecutionState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, result, errorMessage];
}
