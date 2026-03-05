part of 'code_editor_bloc.dart';

enum CodeEditorStatus { initial, loading, loaded, error }

class CodeEditorState extends Equatable {
  const CodeEditorState({
    this.status = CodeEditorStatus.initial,
    this.problem,
    this.selectedLanguage = 'python3',
    this.code = '',
    this.originalCode = '',
    this.testCases = '',
    this.codeDrafts = const {},
    this.errorMessage,
  });

  final CodeEditorStatus status;
  final Problem? problem;
  final String selectedLanguage;
  final String code;
  final String originalCode;
  final String testCases;
  final Map<String, String> codeDrafts;
  final String? errorMessage;

  bool get hasUnsavedChanges => code != originalCode;

  CodeEditorState copyWith({
    CodeEditorStatus? status,
    Problem? problem,
    String? selectedLanguage,
    String? code,
    String? originalCode,
    String? testCases,
    Map<String, String>? codeDrafts,
    String? errorMessage,
  }) {
    return CodeEditorState(
      status: status ?? this.status,
      problem: problem ?? this.problem,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      code: code ?? this.code,
      originalCode: originalCode ?? this.originalCode,
      testCases: testCases ?? this.testCases,
      codeDrafts: codeDrafts ?? this.codeDrafts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    problem,
    selectedLanguage,
    code,
    originalCode,
    testCases,
    codeDrafts,
    errorMessage,
  ];
}
