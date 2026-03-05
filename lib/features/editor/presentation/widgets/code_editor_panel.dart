import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/all.dart';

import '../../../../core/constants/leetcode_languages.dart';
import '../../../../core/theme/color_palette.dart';
import '../bloc/code_editor_bloc.dart';

class CodeEditorPanel extends StatefulWidget {
  const CodeEditorPanel({super.key});

  @override
  State<CodeEditorPanel> createState() => _CodeEditorPanelState();
}

class _CodeEditorPanelState extends State<CodeEditorPanel> {
  CodeController? _codeController;
  String _currentLanguage = '';

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  void _updateController(String code, String language) {
    if (_currentLanguage != language || _codeController == null) {
      _codeController?.dispose();

      final lang = LeetCodeLanguages.fromSlug(language);
      final mode = lang?.highlightMode ?? 'python';

      _codeController = CodeController(
        text: code,
        language: allLanguages[mode],
      );
      _currentLanguage = language;
    } else if (_codeController!.text != code) {
      _codeController!.text = code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<CodeEditorBloc, CodeEditorState>(
      listenWhen: (previous, current) =>
          previous.code != current.code ||
          previous.selectedLanguage != current.selectedLanguage,
      listener: (context, state) {
        _updateController(state.code, state.selectedLanguage);
      },
      builder: (context, state) {
        if (state.status == CodeEditorStatus.loading ||
            state.status == CodeEditorStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        // Initialize controller on first build
        if (_codeController == null) {
          _updateController(state.code, state.selectedLanguage);
        }

        return Column(
          children: [
            // Toolbar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isDark ? ColorPalette.darkCard : ColorPalette.lightCard,
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? ColorPalette.darkDivider
                        : ColorPalette.lightDivider,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Language selector
                  _LanguageDropdown(
                    selectedLanguage: state.selectedLanguage,
                    availableLanguages:
                        state.problem?.codeSnippets
                            .map((s) => s.langSlug)
                            .toList() ??
                        [],
                    onChanged: (lang) {
                      context.read<CodeEditorBloc>().add(
                        CodeEditorLanguageChanged(lang),
                      );
                    },
                  ),
                  const Spacer(),
                  // Reset button
                  if (state.hasUnsavedChanges)
                    Tooltip(
                      message: 'Reset to default code',
                      child: IconButton(
                        onPressed: () {
                          context.read<CodeEditorBloc>().add(
                            CodeEditorResetCode(),
                          );
                        },
                        icon: Icon(
                          CupertinoIcons.arrow_counterclockwise,
                          size: 16,
                          color: isDark
                              ? ColorPalette.darkTextSecondary
                              : ColorPalette.lightTextSecondary,
                        ),
                        iconSize: 16,
                        padding: const EdgeInsets.all(6),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                ],
              ),
            ),
            // Code editor
            Expanded(
              child: CodeTheme(
                data: CodeThemeData(styles: monokaiSublimeTheme),
                child: SingleChildScrollView(
                  child: CodeField(
                    controller: _codeController!,
                    textStyle: GoogleFonts.jetBrainsMono(
                      fontSize: 14,
                      height: 1.5,
                    ),
                    onChanged: (value) {
                      context.read<CodeEditorBloc>().add(
                        CodeEditorCodeChanged(value),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Test cases panel
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? ColorPalette.darkDivider
                        : ColorPalette.lightDivider,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                    child: Text(
                      'Test Cases',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        controller: TextEditingController(
                          text: state.testCases,
                        ),
                        maxLines: null,
                        expands: true,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 12,
                          height: 1.4,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Enter test cases...',
                        ),
                        onChanged: (value) {
                          context.read<CodeEditorBloc>().add(
                            CodeEditorTestCaseChanged(value),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Action bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? ColorPalette.darkCard : ColorPalette.lightCard,
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? ColorPalette.darkDivider
                        : ColorPalette.lightDivider,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implement in Phase 4
                    },
                    icon: const Icon(CupertinoIcons.play, size: 14),
                    label: const Text('Run'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement in Phase 4
                    },
                    icon: const Icon(CupertinoIcons.cloud_upload, size: 14),
                    label: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.accepted,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown({
    required this.selectedLanguage,
    required this.availableLanguages,
    required this.onChanged,
  });

  final String selectedLanguage;
  final List<String> availableLanguages;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final languages = availableLanguages.isNotEmpty
        ? availableLanguages
        : LeetCodeLanguages.slugs;

    return DropdownButton<String>(
      value: languages.contains(selectedLanguage)
          ? selectedLanguage
          : languages.first,
      isDense: true,
      underline: const SizedBox.shrink(),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      items: languages.map((slug) {
        final lang = LeetCodeLanguages.fromSlug(slug);
        return DropdownMenuItem(
          value: slug,
          child: Text(lang?.name ?? slug),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}
