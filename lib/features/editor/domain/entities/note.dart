import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.problemId,
    required this.content,
    required this.updatedAt,
    required this.createdAt,
  });

  final int id;
  final int problemId;
  final String content;
  final DateTime updatedAt;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, problemId, content, updatedAt, createdAt];
}
