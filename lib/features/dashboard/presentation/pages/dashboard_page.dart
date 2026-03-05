import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/widgets/login_dialog.dart';
import '../../domain/entities/user_stats.dart';
import '../bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
                  'Dashboard',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthAuthenticated) {
                      return Row(
                        children: [
                          Icon(
                            CupertinoIcons.person_circle,
                            size: 18,
                            color: ColorPalette.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            state.user.username,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          if (state.user.isPremium) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: ColorPalette.accent.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Premium',
                                style: TextStyle(
                                  color: ColorPalette.accent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      );
                    }
                    return ElevatedButton.icon(
                      onPressed: () => LoginDialog.show(context),
                      icon: const Icon(CupertinoIcons.person_add, size: 16),
                      label: const Text('Connect LeetCode'),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                if (authState is! AuthAuthenticated) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.chart_bar_square,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).textTheme.bodySmall?.color?.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Connect your LeetCode account',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to view your progress and stats',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => LoginDialog.show(context),
                          child: const Text('Connect'),
                        ),
                      ],
                    ),
                  );
                }

                return BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case DashboardStatus.initial:
                      case DashboardStatus.loading:
                        return const LoadingWidget(
                          message: 'Loading stats...',
                        );
                      case DashboardStatus.error:
                        return Center(
                          child: Text(
                            state.errorMessage ?? 'Failed to load dashboard',
                          ),
                        );
                      case DashboardStatus.unauthenticated:
                        return const Center(
                          child: Text('Please reconnect your account'),
                        );
                      case DashboardStatus.loaded:
                        return _DashboardContent(
                          stats: state.stats!,
                          dailyChallenge: state.dailyChallenge,
                          contestStats: state.contestStats,
                          languageStats: state.languageStats,
                          skillStats: state.skillStats,
                        );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.stats,
    this.dailyChallenge,
    this.contestStats,
    this.languageStats = const [],
    this.skillStats,
  });

  final UserStats stats;
  final DailyChallenge? dailyChallenge;
  final ContestStats? contestStats;
  final List<LanguageStat> languageStats;
  final SkillStats? skillStats;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats cards row
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Total Solved',
                  value: '${stats.totalSolved}',
                  subtitle: '/ ${stats.totalQuestions}',
                  color: ColorPalette.primary,
                  icon: CupertinoIcons.checkmark_seal,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Streak',
                  value: '${stats.streak}',
                  subtitle: 'days',
                  color: ColorPalette.accent,
                  icon: CupertinoIcons.flame,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Active Days',
                  value: '${stats.totalActiveDays}',
                  subtitle: 'total',
                  color: ColorPalette.accepted,
                  icon: CupertinoIcons.calendar,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Ranking',
                  value: stats.ranking > 0 ? '#${stats.ranking}' : '-',
                  subtitle: '',
                  color: ColorPalette.medium,
                  icon: CupertinoIcons.star,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Pie chart and daily challenge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _DifficultyChart(stats: stats),
              ),
              const SizedBox(width: 16),
              if (dailyChallenge != null)
                Expanded(
                  child: _DailyChallengeCard(challenge: dailyChallenge!),
                ),
            ],
          ),
          const SizedBox(height: 24),
          // Contest stats and language stats row
          if (contestStats != null || languageStats.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (contestStats != null &&
                    contestStats!.attendedContestsCount > 0)
                  Expanded(
                    child: _ContestCard(contestStats: contestStats!),
                  ),
                if (contestStats != null &&
                    contestStats!.attendedContestsCount > 0 &&
                    languageStats.isNotEmpty)
                  const SizedBox(width: 16),
                if (languageStats.isNotEmpty)
                  Expanded(
                    child: _LanguageStatsCard(languages: languageStats),
                  ),
              ],
            ),
          if (contestStats != null || languageStats.isNotEmpty)
            const SizedBox(height: 24),
          // Skill breakdown
          if (skillStats != null) ...[
            _SkillBreakdownCard(skillStats: skillStats!),
            const SizedBox(height: 24),
          ],
          // Submission heatmap
          Text(
            'Submission Activity',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          _SubmissionHeatmap(calendar: stats.submissionCalendar),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DifficultyChart extends StatelessWidget {
  const _DifficultyChart({required this.stats});

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Difficulty Breakdown',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(
                            value: stats.easySolved.toDouble(),
                            title: '${stats.easySolved}',
                            color: ColorPalette.easy,
                            radius: 35,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            value: stats.mediumSolved.toDouble(),
                            title: '${stats.mediumSolved}',
                            color: ColorPalette.medium,
                            radius: 35,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            value: stats.hardSolved.toDouble(),
                            title: '${stats.hardSolved}',
                            color: ColorPalette.hard,
                            radius: 35,
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LegendItem(
                        color: ColorPalette.easy,
                        label: 'Easy',
                        value: '${stats.easySolved}/${stats.easyTotal}',
                      ),
                      const SizedBox(height: 12),
                      _LegendItem(
                        color: ColorPalette.medium,
                        label: 'Medium',
                        value: '${stats.mediumSolved}/${stats.mediumTotal}',
                      ),
                      const SizedBox(height: 12),
                      _LegendItem(
                        color: ColorPalette.hard,
                        label: 'Hard',
                        value: '${stats.hardSolved}/${stats.hardTotal}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _DailyChallengeCard extends StatelessWidget {
  const _DailyChallengeCard({required this.challenge});

  final DailyChallenge challenge;

  @override
  Widget build(BuildContext context) {
    final diffColor = ColorPalette.difficultyColor(challenge.difficulty);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.calendar_today,
                  size: 16,
                  color: ColorPalette.accent,
                ),
                const SizedBox(width: 8),
                Text(
                  'Daily Challenge',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${challenge.frontendId}. ${challenge.title}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: diffColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    challenge.difficulty,
                    style: TextStyle(
                      color: diffColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${challenge.acRate.toStringAsFixed(1)}% AC',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (challenge.topicTags.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: challenge.topicTags
                    .take(3)
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(fontSize: 10),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/problems/${challenge.titleSlug}');
                },
                child: const Text('Solve'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContestCard extends StatelessWidget {
  const _ContestCard({required this.contestStats});

  final ContestStats contestStats;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.flag,
                  size: 16,
                  color: ColorPalette.accent,
                ),
                const SizedBox(width: 8),
                Text(
                  'Contest Stats',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        contestStats.rating.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.primary,
                            ),
                      ),
                      Text(
                        'Rating',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${contestStats.attendedContestsCount}',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Contests',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        contestStats.globalRanking > 0
                            ? '#${contestStats.globalRanking}'
                            : '-',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Global Rank',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (contestStats.topPercentage > 0) ...[
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Top ${contestStats.topPercentage.toStringAsFixed(1)}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorPalette.accepted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LanguageStatsCard extends StatelessWidget {
  const _LanguageStatsCard({required this.languages});

  final List<LanguageStat> languages;

  @override
  Widget build(BuildContext context) {
    final topLanguages = languages.take(8).toList();
    final maxSolved = topLanguages.isNotEmpty
        ? topLanguages.first.problemsSolved
        : 1;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.chevron_left_slash_chevron_right,
                  size: 16,
                  color: ColorPalette.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Languages',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...topLanguages.map(
              (lang) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        lang.languageName,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: lang.problemsSolved / maxSolved,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        color: ColorPalette.primary,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 32,
                      child: Text(
                        '${lang.problemsSolved}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBreakdownCard extends StatelessWidget {
  const _SkillBreakdownCard({required this.skillStats});

  final SkillStats skillStats;

  @override
  Widget build(BuildContext context) {
    final hasFundamental = skillStats.fundamental.isNotEmpty;
    final hasIntermediate = skillStats.intermediate.isNotEmpty;
    final hasAdvanced = skillStats.advanced.isNotEmpty;

    if (!hasFundamental && !hasIntermediate && !hasAdvanced) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.graph_square,
                  size: 16,
                  color: ColorPalette.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (hasFundamental)
              _SkillSection(
                label: 'Fundamental',
                color: ColorPalette.easy,
                skills: skillStats.fundamental.take(8).toList(),
              ),
            if (hasIntermediate) ...[
              if (hasFundamental) const SizedBox(height: 12),
              _SkillSection(
                label: 'Intermediate',
                color: ColorPalette.medium,
                skills: skillStats.intermediate.take(8).toList(),
              ),
            ],
            if (hasAdvanced) ...[
              if (hasFundamental || hasIntermediate) const SizedBox(height: 12),
              _SkillSection(
                label: 'Advanced',
                color: ColorPalette.hard,
                skills: skillStats.advanced.take(8).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SkillSection extends StatelessWidget {
  const _SkillSection({
    required this.label,
    required this.color,
    required this.skills,
  });

  final String label;
  final Color color;
  final List<TagSkill> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: skills
              .map(
                (skill) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: color.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    '${skill.tagName} x${skill.problemsSolved}',
                    style: TextStyle(fontSize: 11, color: color),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SubmissionHeatmap extends StatelessWidget {
  const _SubmissionHeatmap({required this.calendar});

  final Map<String, int> calendar;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (calendar.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'No submission data available',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      );
    }

    // Build a simplified heatmap grid (last 52 weeks)
    final now = DateTime.now();
    final cells = <Widget>[];

    for (var week = 51; week >= 0; week--) {
      final weekCells = <Widget>[];
      for (var day = 0; day < 7; day++) {
        final date = now.subtract(Duration(days: week * 7 + (6 - day)));
        // Check nearby timestamps (within a day)
        var count = 0;
        for (final entry in calendar.entries) {
          final entryTime = int.tryParse(entry.key) ?? 0;
          final dateSec = date.millisecondsSinceEpoch ~/ 1000;
          if ((entryTime - dateSec).abs() < 86400) {
            count = entry.value;
            break;
          }
        }

        weekCells.add(
          Tooltip(
            message:
                '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}: $count submissions',
            child: Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: _getHeatmapColor(count, isDark),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      }
      cells.add(Column(children: weekCells));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: cells),
        ),
      ),
    );
  }

  Color _getHeatmapColor(int count, bool isDark) {
    if (count == 0) {
      return isDark ? ColorPalette.heatmapEmpty : const Color(0xFFEBEDF0);
    }
    if (count <= 2) return ColorPalette.heatmapLevel1;
    if (count <= 5) return ColorPalette.heatmapLevel2;
    if (count <= 10) return ColorPalette.heatmapLevel3;
    return ColorPalette.heatmapLevel4;
  }
}
