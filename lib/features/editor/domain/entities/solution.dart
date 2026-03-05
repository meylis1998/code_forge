import 'package:equatable/equatable.dart';

class Solution extends Equatable {
  const Solution({
    required this.id,
    required this.title,
    required this.content,
    this.isPaidOnly = false,
    this.hasVideoSolution = false,
    this.canSeeDetail = true,
  });

  final int id;
  final String title;
  final String content;
  final bool isPaidOnly;
  final bool hasVideoSolution;
  final bool canSeeDetail;

  @override
  List<Object?> get props => [id, title, content, isPaidOnly];
}
