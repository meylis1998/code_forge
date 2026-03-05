import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../problems/domain/entities/problem_entity.dart';

class ProblemDescriptionPanel extends StatelessWidget {
  const ProblemDescriptionPanel({
    required this.problem,
    super.key,
  });

  final Problem problem;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Problem header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? ColorPalette.darkDivider
                    : ColorPalette.lightDivider,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${problem.frontendId}. ${problem.title}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 12),
                  _DifficultyChip(difficulty: problem.difficulty),
                ],
              ),
              if (problem.topicTags.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: problem.topicTags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: ColorPalette.primary
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag.name,
                            style: TextStyle(
                              fontSize: 11,
                              color: ColorPalette.primary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.hand_thumbsup,
                    size: 14,
                    color: isDark
                        ? ColorPalette.darkTextSecondary
                        : ColorPalette.lightTextSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${problem.likes}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    CupertinoIcons.hand_thumbsdown,
                    size: 14,
                    color: isDark
                        ? ColorPalette.darkTextSecondary
                        : ColorPalette.lightTextSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${problem.dislikes}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Acceptance: ${problem.acRate.toStringAsFixed(1)}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Problem content
        Expanded(
          child: problem.content != null
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: HtmlWidget(
                    problem.content!,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.lock,
                        size: 48,
                        color: isDark
                            ? ColorPalette.darkTextSecondary
                            : ColorPalette.lightTextSecondary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Problem description not available',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Connect your LeetCode account to view details',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  const _DifficultyChip({required this.difficulty});

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    final color = ColorPalette.difficultyColor(difficulty);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
