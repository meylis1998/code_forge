part of 'code_template_cubit.dart';

enum CodeTemplateStatus { initial, loading, loaded }

class CodeTemplateState extends Equatable {
  const CodeTemplateState({
    this.status = CodeTemplateStatus.initial,
    this.templates = const [],
  });

  final CodeTemplateStatus status;
  final List<CodeTemplate> templates;

  CodeTemplateState copyWith({
    CodeTemplateStatus? status,
    List<CodeTemplate>? templates,
  }) {
    return CodeTemplateState(
      status: status ?? this.status,
      templates: templates ?? this.templates,
    );
  }

  @override
  List<Object?> get props => [status, templates];
}
