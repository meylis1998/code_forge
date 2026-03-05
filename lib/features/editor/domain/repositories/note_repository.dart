import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, Note?>> getNote(int problemId);
  Future<Either<Failure, Note>> saveNote(int problemId, String content);
  Future<Either<Failure, void>> deleteNote(int problemId);
}
