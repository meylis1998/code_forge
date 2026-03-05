import 'package:equatable/equatable.dart';

class Problem extends Equatable {
  const Problem({
    required this.id,
    required this.frontendId,
    required this.title,
    required this.titleSlug,
    required this.difficulty,
    this.content,
    this.acRate = 0,
    this.isPaidOnly = false,
    this.status,
    this.likes = 0,
    this.dislikes = 0,
    this.categoryTitle = '',
    this.hints,
    this.exampleTestcases,
    this.sampleTestCase,
    this.isFavorite = false,
    this.topicTags = const [],
    this.codeSnippets = const [],
    this.similarQuestions = const [],
    this.metaData,
    this.stats,
    this.hasSolution = false,
    this.hasVideoSolution = false,
  });

  final int id;
  final String frontendId;
  final String title;
  final String titleSlug;
  final String difficulty;
  final String? content;
  final double acRate;
  final bool isPaidOnly;
  final String? status; // null, 'ac', 'notac'
  final int likes;
  final int dislikes;
  final String categoryTitle;
  final List<String>? hints;
  final String? exampleTestcases;
  final String? sampleTestCase;
  final bool isFavorite;
  final List<TopicTag> topicTags;
  final List<CodeSnippet> codeSnippets;
  final List<SimilarQuestion> similarQuestions;
  final ProblemMetaData? metaData;
  final ProblemStats? stats;
  final bool hasSolution;
  final bool hasVideoSolution;

  bool get isSolved => status == 'ac';
  bool get isAttempted => status == 'notac';

  @override
  List<Object?> get props => [id, titleSlug];
}

class TopicTag extends Equatable {
  const TopicTag({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;

  @override
  List<Object?> get props => [id, slug];
}

class CodeSnippet extends Equatable {
  const CodeSnippet({
    required this.lang,
    required this.langSlug,
    required this.code,
  });

  final String lang;
  final String langSlug;
  final String code;

  @override
  List<Object?> get props => [langSlug, code];
}

class SimilarQuestion extends Equatable {
  const SimilarQuestion({
    required this.title,
    required this.titleSlug,
    required this.difficulty,
    this.isPaidOnly = false,
  });

  final String title;
  final String titleSlug;
  final String difficulty;
  final bool isPaidOnly;

  @override
  List<Object?> get props => [titleSlug];
}

class ProblemMetaData extends Equatable {
  const ProblemMetaData({
    this.name,
    this.params = const [],
    this.returnType,
  });

  final String? name;
  final List<ParamInfo> params;
  final String? returnType;

  @override
  List<Object?> get props => [name, params];
}

class ParamInfo extends Equatable {
  const ParamInfo({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;

  @override
  List<Object?> get props => [name, type];
}

class ProblemStats extends Equatable {
  const ProblemStats({
    this.totalAccepted = '',
    this.totalSubmission = '',
    this.totalAcceptedRaw = 0,
    this.totalSubmissionRaw = 0,
    this.acRate = '',
  });

  final String totalAccepted;
  final String totalSubmission;
  final int totalAcceptedRaw;
  final int totalSubmissionRaw;
  final String acRate;

  @override
  List<Object?> get props => [totalAcceptedRaw, totalSubmissionRaw];
}
