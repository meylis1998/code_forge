import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../bloc/note_cubit.dart';

class NotesPanel extends StatefulWidget {
  const NotesPanel({required this.problemId, super.key});

  final int problemId;

  @override
  State<NotesPanel> createState() => _NotesPanelState();
}

class _NotesPanelState extends State<NotesPanel> {
  late TextEditingController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String text) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 2), () {
      context.read<NoteCubit>().saveNote(widget.problemId, text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<NoteCubit, NoteState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == NoteStatus.loaded &&
          previous.status == NoteStatus.loading,
      listener: (context, state) {
        _controller.text = state.content;
      },
      builder: (context, state) {
        if (state.status == NoteStatus.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
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
                  Icon(
                    CupertinoIcons.doc_text,
                    size: 14,
                    color: isDark
                        ? ColorPalette.darkTextSecondary
                        : ColorPalette.lightTextSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Notes',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Spacer(),
                  if (state.status == NoteStatus.saving)
                    Text(
                      'Saving...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? ColorPalette.darkTextSecondary
                                : ColorPalette.lightTextSecondary,
                          ),
                    )
                  else if (state.status == NoteStatus.saved)
                    Text(
                      'Saved',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorPalette.accepted,
                          ),
                    ),
                ],
              ),
            ),
            // Text field
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: _onTextChanged,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 13,
                    ),
                decoration: InputDecoration(
                  hintText: 'Write your notes here...',
                  hintStyle:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? ColorPalette.darkTextSecondary
                                : ColorPalette.lightTextSecondary,
                          ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
