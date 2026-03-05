import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/leetcode_languages.dart';
import '../bloc/code_template_cubit.dart';

class CodeTemplateEditorDialog extends StatefulWidget {
  const CodeTemplateEditorDialog({
    required this.language,
    required this.initialTemplate,
    super.key,
  });

  final LeetCodeLanguage language;
  final String initialTemplate;

  static Future<void> show(
    BuildContext context, {
    required LeetCodeLanguage language,
    required String initialTemplate,
  }) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<CodeTemplateCubit>(),
        child: CodeTemplateEditorDialog(
          language: language,
          initialTemplate: initialTemplate,
        ),
      ),
    );
  }

  @override
  State<CodeTemplateEditorDialog> createState() =>
      _CodeTemplateEditorDialogState();
}

class _CodeTemplateEditorDialogState extends State<CodeTemplateEditorDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTemplate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.language.name} Template'),
      content: SizedBox(
        width: 500,
        height: 300,
        child: TextField(
          controller: _controller,
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(
            fontFamily: 'JetBrains Mono',
            fontSize: 13,
          ),
          decoration: InputDecoration(
            hintText:
                'Enter boilerplate code to prepend when starting a new ${widget.language.name} problem...',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        if (widget.initialTemplate.isNotEmpty)
          TextButton(
            onPressed: () {
              _controller.clear();
              context.read<CodeTemplateCubit>().saveTemplate(
                    widget.language.slug,
                    '',
                  );
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
        FilledButton(
          onPressed: () {
            context.read<CodeTemplateCubit>().saveTemplate(
                  widget.language.slug,
                  _controller.text,
                );
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
