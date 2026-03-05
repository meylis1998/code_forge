import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({required NoteRepository noteRepository})
    : _noteRepository = noteRepository,
      super(const NoteState());

  final NoteRepository _noteRepository;

  Future<void> loadNote(int problemId) async {
    emit(state.copyWith(status: NoteStatus.loading, problemId: problemId));

    final result = await _noteRepository.getNote(problemId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NoteStatus.loaded,
          content: '',
        ),
      ),
      (note) => emit(
        state.copyWith(
          status: NoteStatus.loaded,
          content: note?.content ?? '',
          note: note,
        ),
      ),
    );
  }

  Future<void> saveNote(int problemId, String content) async {
    if (content.isEmpty) {
      await _noteRepository.deleteNote(problemId);
      emit(
        state.copyWith(
          status: NoteStatus.loaded,
          content: '',
          clearNote: true,
        ),
      );
      return;
    }

    emit(state.copyWith(status: NoteStatus.saving));

    final result = await _noteRepository.saveNote(problemId, content);

    result.fold(
      (failure) => emit(state.copyWith(status: NoteStatus.loaded)),
      (note) => emit(
        state.copyWith(
          status: NoteStatus.saved,
          content: content,
          note: note,
        ),
      ),
    );
  }
}
