part of 'note_cubit.dart';

enum NoteStatus { initial, loading, loaded, saving, saved }

class NoteState extends Equatable {
  const NoteState({
    this.status = NoteStatus.initial,
    this.problemId,
    this.content = '',
    this.note,
  });

  final NoteStatus status;
  final int? problemId;
  final String content;
  final Note? note;

  bool get hasNote => content.isNotEmpty;

  NoteState copyWith({
    NoteStatus? status,
    int? problemId,
    String? content,
    Note? note,
    bool clearNote = false,
  }) {
    return NoteState(
      status: status ?? this.status,
      problemId: problemId ?? this.problemId,
      content: content ?? this.content,
      note: clearNote ? null : (note ?? this.note),
    );
  }

  @override
  List<Object?> get props => [status, problemId, content, note];
}
