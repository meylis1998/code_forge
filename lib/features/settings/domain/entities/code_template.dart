import 'package:equatable/equatable.dart';

class CodeTemplate extends Equatable {
  const CodeTemplate({
    required this.languageSlug,
    required this.template,
    this.updatedAt,
  });

  final String languageSlug;
  final String template;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [languageSlug, template, updatedAt];
}
