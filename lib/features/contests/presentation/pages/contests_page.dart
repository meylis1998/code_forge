import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../bloc/contest_bloc.dart';
import '../widgets/contest_card.dart';
import '../widgets/countdown_timer.dart';

class ContestsPage extends StatelessWidget {
  const ContestsPage({super.key});

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
                  'Contests',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () =>
                      context.read<ContestBloc>().add(ContestsRefreshed()),
                  icon: const Icon(CupertinoIcons.refresh, size: 18),
                  tooltip: 'Refresh',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<ContestBloc, ContestState>(
              builder: (context, state) {
                switch (state.status) {
                  case ContestStatus.initial:
                  case ContestStatus.loading:
                    return const LoadingWidget(
                      message: 'Loading contests...',
                    );
                  case ContestStatus.error:
                    return AppErrorWidget(
                      message: state.errorMessage ?? 'Failed to load contests',
                      onRetry: () =>
                          context.read<ContestBloc>().add(ContestsLoaded()),
                    );
                  case ContestStatus.loaded:
                    return _ContestsList(state: state);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContestsList extends StatelessWidget {
  const _ContestsList({required this.state});

  final ContestState state;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Next contest hero card
          if (state.nextContest != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorPalette.primary.withValues(alpha: 0.15),
                    ColorPalette.primary.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorPalette.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Next Contest',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorPalette.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.nextContest!.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (state.nextContest!.isUpcoming)
                    CountdownTimer(
                      targetTime: state.nextContest!.startTime,
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.medium.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'In Progress',
                        style: TextStyle(
                          color: ColorPalette.medium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'Duration: ${state.nextContest!.formattedDuration}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Upcoming contests
          if (state.upcoming.length > 1) ...[
            Text(
              'Upcoming',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...state.upcoming
                .skip(1)
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ContestCard(contest: c),
                  ),
                ),
            const SizedBox(height: 24),
          ],

          // Past contests
          if (state.past.isNotEmpty) ...[
            Row(
              children: [
                Text(
                  'Past Contests',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${state.past.length})',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? ColorPalette.darkTextSecondary
                        : ColorPalette.lightTextSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...state.past
                .take(20)
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ContestCard(contest: c),
                  ),
                ),
          ],
        ],
      ),
    );
  }
}
