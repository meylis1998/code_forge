import 'package:dartz/dartz.dart';

import '../../../../core/database/daos/note_dao.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl({required this.noteDao});

  final NoteDao noteDao;

  @override
  Future<Either<Failure, Note?>> getNote(int problemId) async {
    try {
      final data = await noteDao.getNoteForProblem(problemId);
      if (data == null) return const Right(null);
      return Right(
        Note(
          id: data.id,
          problemId: data.problemId,
          content: data.content,
          updatedAt: data.updatedAt,
          createdAt: data.createdAt,
        ),
      );
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> saveNote(int problemId, String content) async {
    try {
      await noteDao.saveNote(problemId, content);
      final data = await noteDao.getNoteForProblem(problemId);
      return Right(
        Note(
          id: data!.id,
          problemId: data.problemId,
          content: data.content,
          updatedAt: data.updatedAt,
          createdAt: data.createdAt,
        ),
      );
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(int problemId) async {
    try {
      await noteDao.deleteNote(problemId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
