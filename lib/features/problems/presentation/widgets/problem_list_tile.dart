import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/problem_entity.dart';

class ProblemListTile extends StatefulWidget {
  const ProblemListTile({
    required this.problem,
    required this.onTap,
    this.onFavoriteToggle,
    super.key,
  });

  final Problem problem;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteToggle;

  @override
  State<ProblemListTile> createState() => _ProblemListTileState();
}

class _ProblemListTileState extends State<ProblemListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: _isHovered
              ? (isDark
                    ? Colors.white.withValues(alpha: 0.03)
                    : Colors.black.withValues(alpha: 0.02))
              : Colors.transparent,
          child: Row(
            children: [
              // Status indicator
              SizedBox(
                width: 24,
                child: _buildStatusIcon(),
              ),
              const SizedBox(width: 12),
              // Frontend ID
              SizedBox(
                width: 50,
                child: Text(
                  widget.problem.frontendId,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Title
              Expanded(
                child: Text(
                  widget.problem.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              // Tags (first 2)
              if (widget.problem.topicTags.isNotEmpty)
                SizedBox(
                  width: 200,
                  child: Wrap(
                    spacing: 4,
                    children: widget.problem.topicTags
                        .take(2)
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.06)
                                  : Colors.black.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag.name,
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(fontSize: 10),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              const SizedBox(width: 12),
              // Acceptance rate
              SizedBox(
                width: 60,
                child: Text(
                  '${widget.problem.acRate.toStringAsFixed(1)}%',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 16),
              // Difficulty badge
              _DifficultyBadge(difficulty: widget.problem.difficulty),
              const SizedBox(width: 8),
              // Favorite icon
              GestureDetector(
                onTap: widget.onFavoriteToggle,
                child: Icon(
                  widget.problem.isFavorite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 16,
                  color: widget.problem.isFavorite
                      ? const Color(0xFFFF6B6B)
                      : Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
                ),
              ),
              const SizedBox(width: 8),
              // Paid icon
              if (widget.problem.isPaidOnly)
                Icon(
                  CupertinoIcons.lock_fill,
                  size: 14,
                  color: ColorPalette.medium,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    if (widget.problem.isSolved) {
      return Icon(
        CupertinoIcons.checkmark_circle_fill,
        size: 18,
        color: ColorPalette.accepted,
      );
    } else if (widget.problem.isAttempted) {
      return Icon(
        CupertinoIcons.circle_bottomthird_split,
        size: 18,
        color: ColorPalette.medium,
      );
    }
    return const SizedBox.shrink();
  }
}

class _DifficultyBadge extends StatelessWidget {
  const _DifficultyBadge({required this.difficulty});

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    final color = ColorPalette.difficultyColor(difficulty);

    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
