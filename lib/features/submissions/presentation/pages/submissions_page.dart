import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../bloc/submissions_bloc.dart';

class SubmissionsPage extends StatelessWidget {
  const SubmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 38, color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Row(
              children: [
                Text(
                  'Submissions',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<SubmissionsBloc, SubmissionsState>(
              builder: (context, state) {
                switch (state.status) {
                  case SubmissionsStatus.initial:
                  case SubmissionsStatus.loading:
                    return const LoadingWidget(
                      message: 'Loading submissions...',
                    );
                  case SubmissionsStatus.error:
                    return Center(
                      child: Text(state.errorMessage ?? 'Error'),
                    );
                  case SubmissionsStatus.loaded:
                    if (state.submissions.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              size: 56,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No submissions yet',
                              style:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Submit solutions to see them here',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.submissions.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final sub = state.submissions[index];
                        final isAccepted =
                            sub.statusDisplay == 'Accepted';
                        final date = DateTime.fromMillisecondsSinceEpoch(
                          sub.timestamp * 1000,
                        );

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Icon(
                                  isAccepted
                                      ? CupertinoIcons
                                          .checkmark_circle_fill
                                      : CupertinoIcons
                                          .xmark_circle_fill,
                                  color: isAccepted
                                      ? ColorPalette.accepted
                                      : ColorPalette.wrongAnswer,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sub.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${sub.statusDisplay} • ${sub.lang}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isAccepted
                                              ? ColorPalette.accepted
                                              : ColorPalette.wrongAnswer,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (sub.runtime != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          sub.runtime!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          'Runtime',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                if (sub.memory != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          sub.memory!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          'Memory',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                Text(
                                  DateFormat('MMM d, yyyy')
                                      .format(date),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
