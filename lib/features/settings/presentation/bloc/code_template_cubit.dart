import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/daos/code_template_dao.dart';
import '../../domain/entities/code_template.dart';

part 'code_template_state.dart';

class CodeTemplateCubit extends Cubit<CodeTemplateState> {
  CodeTemplateCubit({required CodeTemplateDao codeTemplateDao})
      : _codeTemplateDao = codeTemplateDao,
        super(const CodeTemplateState());

  final CodeTemplateDao _codeTemplateDao;

  Future<void> loadTemplates() async {
    emit(state.copyWith(status: CodeTemplateStatus.loading));

    final data = await _codeTemplateDao.getAllTemplates();
    final templates = data
        .map(
          (d) => CodeTemplate(
            languageSlug: d.languageSlug,
            template: d.template,
            updatedAt: d.updatedAt,
          ),
        )
        .toList();

    emit(state.copyWith(
      status: CodeTemplateStatus.loaded,
      templates: templates,
    ));
  }

  Future<void> saveTemplate(String languageSlug, String template) async {
    if (template.trim().isEmpty) {
      await _codeTemplateDao.deleteTemplate(languageSlug);
    } else {
      await _codeTemplateDao.saveTemplate(languageSlug, template);
    }
    await loadTemplates();
  }

  String? getTemplate(String languageSlug) {
    final match = state.templates
        .where((t) => t.languageSlug == languageSlug)
        .toList();
    if (match.isEmpty) return null;
    return match.first.template;
  }
}
