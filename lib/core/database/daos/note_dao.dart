import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/notes_table.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [NotesTable])
class NoteDao extends DatabaseAccessor<AppDatabase> with _$NoteDaoMixin {
  NoteDao(super.db);

  Future<NotesTableData?> getNoteForProblem(int problemId) {
    return (select(notesTable)
          ..where((n) => n.problemId.equals(problemId)))
        .getSingleOrNull();
  }

  Future<void> saveNote(int problemId, String content) {
    return into(notesTable).insertOnConflictUpdate(
      NotesTableCompanion.insert(
        problemId: problemId,
        content: content,
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteNote(int problemId) {
    return (delete(notesTable)
          ..where((n) => n.problemId.equals(problemId)))
        .go();
  }

  Future<List<NotesTableData>> getAllNotes() {
    return (select(notesTable)
          ..orderBy([(n) => OrderingTerm.desc(n.updatedAt)]))
        .get();
  }

  Future<int> getNotesCount() async {
    final countExp = notesTable.id.count();
    final query = selectOnly(notesTable)..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Future<Set<int>> getProblemIdsWithNotes() async {
    final query = selectOnly(notesTable)
      ..addColumns([notesTable.problemId]);
    final results = await query.get();
    return results.map((r) => r.read(notesTable.problemId)!).toSet();
  }
}
