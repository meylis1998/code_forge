// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_template_dao.dart';

// ignore_for_file: type=lint
mixin _$CodeTemplateDaoMixin on DatabaseAccessor<AppDatabase> {
  $CodeTemplatesTableTable get codeTemplatesTable =>
      attachedDatabase.codeTemplatesTable;
  CodeTemplateDaoManager get managers => CodeTemplateDaoManager(this);
}

class CodeTemplateDaoManager {
  final _$CodeTemplateDaoMixin _db;
  CodeTemplateDaoManager(this._db);
  $$CodeTemplatesTableTableTableManager get codeTemplatesTable =>
      $$CodeTemplatesTableTableTableManager(
        _db.attachedDatabase,
        _db.codeTemplatesTable,
      );
}
