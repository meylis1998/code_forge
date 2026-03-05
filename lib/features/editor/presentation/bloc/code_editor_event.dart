part of 'code_editor_bloc.dart';

abstract class CodeEditorEvent extends Equatable {
  const CodeEditorEvent();

  @override
  List<Object?> get props => [];
}

class CodeEditorLoadProblem extends CodeEditorEvent {
  const CodeEditorLoadProblem(this.titleSlug);

  final String titleSlug;

  @override
  List<Object?> get props => [titleSlug];
}

class CodeEditorLanguageChanged extends CodeEditorEvent {
  const CodeEditorLanguageChanged(this.language);

  final String language;

  @override
  List<Object?> get props => [language];
}

class CodeEditorCodeChanged extends CodeEditorEvent {
  const CodeEditorCodeChanged(this.code);

  final String code;

  @override
  List<Object?> get props => [code];
}

class CodeEditorResetCode extends CodeEditorEvent {}

class CodeEditorTestCaseChanged extends CodeEditorEvent {
  const CodeEditorTestCaseChanged(this.testCases);

  final String testCases;

  @override
  List<Object?> get props => [testCases];
}
