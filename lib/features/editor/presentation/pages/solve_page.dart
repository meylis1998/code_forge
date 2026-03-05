import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/split_view.dart';
import '../bloc/code_editor_bloc.dart';
import '../bloc/note_cubit.dart';
import '../bloc/solution_cubit.dart';
import '../widgets/code_editor_panel.dart';
import '../widgets/problem_description_panel.dart';

class SolvePage extends StatelessWidget {
  const SolvePage({required this.titleSlug, super.key});

  final String titleSlug;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              sl<CodeEditorBloc>()..add(CodeEditorLoadProblem(titleSlug)),
        ),
        BlocProvider(create: (_) => sl<NoteCubit>()),
        BlocProvider(create: (_) => sl<SolutionCubit>()),
      ],
      child: _SolvePageContent(titleSlug: titleSlug),
    );
  }
}

class _SolvePageContent extends StatelessWidget {
  const _SolvePageContent({required this.titleSlug});

  final String titleSlug;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyL, meta: true): () {
          // Cmd+L: Focus on language selector
        },
        const SingleActivator(LogicalKeyboardKey.enter, meta: true): () {
          // Cmd+Enter: Run code
        },
        const SingleActivator(
          LogicalKeyboardKey.enter,
          meta: true,
          shift: true,
        ): () {
          // Cmd+Shift+Enter: Submit
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Column(
            children: [
              // Title bar with back button
              Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isDark
                      ? ColorPalette.darkSurface
                      : ColorPalette.lightSurface,
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
                    const SizedBox(width: 70),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(CupertinoIcons.back, size: 18),
                      tooltip: 'Back to Problems (Esc)',
                      iconSize: 18,
                      padding: const EdgeInsets.all(4),
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 12),
                    BlocBuilder<CodeEditorBloc, CodeEditorState>(
                      builder: (context, state) {
                        final problem = state.problem;
                        if (problem == null) return const SizedBox.shrink();
                        return Expanded(
                          child: Text(
                            '${problem.frontendId}. ${problem.title}',
                            style:
                                Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: BlocConsumer<CodeEditorBloc, CodeEditorState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  listenWhen: (previous, current) =>
                      previous.status != current.status &&
                      current.status == CodeEditorStatus.loaded,
                  listener: (context, state) {
                    context.read<NoteCubit>().loadNote(state.problem!.id);
                  },
                  builder: (context, state) {
                    switch (state.status) {
                      case CodeEditorStatus.initial:
                      case CodeEditorStatus.loading:
                        return const LoadingWidget(
                          message: 'Loading problem...',
                        );
                      case CodeEditorStatus.error:
                        return AppErrorWidget(
                          message: state.errorMessage ??
                              'Failed to load problem',
                          onRetry: () => context
                              .read<CodeEditorBloc>()
                              .add(
                                CodeEditorLoadProblem(titleSlug),
                              ),
                        );
                      case CodeEditorStatus.loaded:
                        return SplitView(
                          left: ProblemDescriptionPanel(
                            problem: state.problem!,
                          ),
                          right: const CodeEditorPanel(),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
