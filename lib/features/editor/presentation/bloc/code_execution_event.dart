part of 'code_execution_bloc.dart';

abstract class CodeExecutionEvent extends Equatable {
  const CodeExecutionEvent();

  @override
  List<Object?> get props => [];
}

class CodeExecutionRunRequested extends CodeExecutionEvent {
  const CodeExecutionRunRequested({
    required this.titleSlug,
    required this.code,
    required this.language,
    required this.testCases,
    required this.questionId,
  });

  final String titleSlug;
  final String code;
  final String language;
  final String testCases;
  final String questionId;

  @override
  List<Object?> get props => [titleSlug, code, language, testCases, questionId];
}

class CodeExecutionSubmitRequested extends CodeExecutionEvent {
  const CodeExecutionSubmitRequested({
    required this.titleSlug,
    required this.code,
    required this.language,
    required this.questionId,
  });

  final String titleSlug;
  final String code;
  final String language;
  final String questionId;

  @override
  List<Object?> get props => [titleSlug, code, language, questionId];
}

class CodeExecutionReset extends CodeExecutionEvent {}
