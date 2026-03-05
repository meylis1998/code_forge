// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dao.dart';

// ignore_for_file: type=lint
mixin _$NoteDaoMixin on DatabaseAccessor<AppDatabase> {
  $NotesTableTable get notesTable => attachedDatabase.notesTable;
  NoteDaoManager get managers => NoteDaoManager(this);
}

class NoteDaoManager {
  final _$NoteDaoMixin _db;
  NoteDaoManager(this._db);
  $$NotesTableTableTableManager get notesTable =>
      $$NotesTableTableTableManager(_db.attachedDatabase, _db.notesTable);
}
