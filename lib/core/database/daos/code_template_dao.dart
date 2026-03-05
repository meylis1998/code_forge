import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/code_templates_table.dart';

part 'code_template_dao.g.dart';

@DriftAccessor(tables: [CodeTemplatesTable])
class CodeTemplateDao extends DatabaseAccessor<AppDatabase>
    with _$CodeTemplateDaoMixin {
  CodeTemplateDao(super.db);

  Future<CodeTemplatesTableData?> getTemplate(String languageSlug) {
    return (select(
      codeTemplatesTable,
    )..where((t) => t.languageSlug.equals(languageSlug))).getSingleOrNull();
  }

  Future<List<CodeTemplatesTableData>> getAllTemplates() {
    return (select(
      codeTemplatesTable,
    )..orderBy([(t) => OrderingTerm.asc(t.languageSlug)])).get();
  }

  Future<void> saveTemplate(String languageSlug, String template) {
    return into(codeTemplatesTable).insertOnConflictUpdate(
      CodeTemplatesTableCompanion.insert(
        languageSlug: languageSlug,
        template: template,
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteTemplate(String languageSlug) {
    return (delete(
      codeTemplatesTable,
    )..where((t) => t.languageSlug.equals(languageSlug))).go();
  }
}
