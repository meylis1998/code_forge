import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../bloc/problem_list_bloc.dart';
import '../widgets/problem_filter_bar.dart';
import '../widgets/problem_list_tile.dart';

class ProblemsPage extends StatelessWidget {
  const ProblemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Title bar drag area
          Container(height: 38, color: Colors.transparent),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: Row(
              children: [
                Text(
                  'Problems',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 12),
                BlocBuilder<ProblemListBloc, ProblemListState>(
                  builder: (context, state) {
                    if (state.status == ProblemListStatus.success) {
                      return Text(
                        '${state.problems.length} problems',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: 280,
                  child: CupertinoSearchTextField(
                    placeholder: 'Search problems...',
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) {
                      context
                          .read<ProblemListBloc>()
                          .add(ProblemListSearchChanged(value));
                    },
                  ),
                ),
              ],
            ),
          ),
          // Filter bar
          BlocBuilder<ProblemListBloc, ProblemListState>(
            buildWhen: (previous, current) =>
                previous.filter != current.filter,
            builder: (context, state) {
              return ProblemFilterBar(
                filter: state.filter,
                onFilterChanged: (filter) {
                  context
                      .read<ProblemListBloc>()
                      .add(ProblemListFilterChanged(filter));
                },
              );
            },
          ),
          // Column headers
          _ColumnHeaders(),
          const Divider(height: 1),
          // Problem list
          Expanded(
            child: BlocBuilder<ProblemListBloc, ProblemListState>(
              builder: (context, state) {
                switch (state.status) {
                  case ProblemListStatus.initial:
                  case ProblemListStatus.loading:
                    return const LoadingWidget(message: 'Loading problems...');
                  case ProblemListStatus.failure:
                    return AppErrorWidget(
                      message: state.errorMessage ?? 'Failed to load problems',
                      onRetry: () => context
                          .read<ProblemListBloc>()
                          .add(ProblemListFetched()),
                    );
                  case ProblemListStatus.success:
                    if (state.problems.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: 48,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No problems found',
                              style:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try adjusting your filters or search query',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    }

                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter < 200) {
                          context
                              .read<ProblemListBloc>()
                              .add(ProblemListLoadMore());
                        }
                        return false;
                      },
                      child: ListView.separated(
                        itemCount: state.problems.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, indent: 24, endIndent: 24),
                        itemBuilder: (context, index) {
                          final problem = state.problems[index];
                          return ProblemListTile(
                            problem: problem,
                            onTap: () {
                              context.push('/problems/${problem.titleSlug}');
                            },
                          );
                        },
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ColumnHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).brightness == Brightness.dark
              ? ColorPalette.darkTextSecondary
              : ColorPalette.lightTextSecondary,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 24, child: Text('', style: style)),
          const SizedBox(width: 12),
          SizedBox(width: 50, child: Text('#', style: style)),
          const SizedBox(width: 12),
          Expanded(child: Text('Title', style: style)),
          const SizedBox(width: 12),
          SizedBox(width: 200, child: Text('Tags', style: style)),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            child: Text('AC Rate', style: style, textAlign: TextAlign.right),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 64,
            child: Text('Difficulty', style: style, textAlign: TextAlign.center),
          ),
          const SizedBox(width: 22),
        ],
      ),
    );
  }
}
