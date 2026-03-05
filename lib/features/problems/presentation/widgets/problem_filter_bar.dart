import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/problem_filter.dart';

class ProblemFilterBar extends StatelessWidget {
  const ProblemFilterBar({
    required this.filter,
    required this.onFilterChanged,
    super.key,
  });

  final ProblemFilter filter;
  final ValueChanged<ProblemFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          // Difficulty filter
          _FilterChip(
            label: 'Easy',
            isSelected: filter.difficulty == 'Easy',
            color: ColorPalette.easy,
            onTap: () => _toggleDifficulty('Easy'),
          ),
          const SizedBox(width: 6),
          _FilterChip(
            label: 'Medium',
            isSelected: filter.difficulty == 'Medium',
            color: ColorPalette.medium,
            onTap: () => _toggleDifficulty('Medium'),
          ),
          const SizedBox(width: 6),
          _FilterChip(
            label: 'Hard',
            isSelected: filter.difficulty == 'Hard',
            color: ColorPalette.hard,
            onTap: () => _toggleDifficulty('Hard'),
          ),
          const SizedBox(width: 16),
          // Status filter
          _FilterChip(
            label: 'Solved',
            isSelected: filter.status == 'ac',
            color: ColorPalette.accepted,
            icon: CupertinoIcons.checkmark_circle,
            onTap: () => _toggleStatus('ac'),
          ),
          const SizedBox(width: 6),
          _FilterChip(
            label: 'Attempted',
            isSelected: filter.status == 'notac',
            color: ColorPalette.medium,
            icon: CupertinoIcons.circle_bottomthird_split,
            onTap: () => _toggleStatus('notac'),
          ),
          const SizedBox(width: 16),
          _FilterChip(
            label: 'Favorites',
            isSelected: filter.isFavorite,
            color: const Color(0xFFFF6B6B),
            icon: CupertinoIcons.heart_fill,
            onTap: _toggleFavorite,
          ),
          const Spacer(),
          // Clear filters
          if (_hasActiveFilters)
            TextButton.icon(
              onPressed: _clearFilters,
              icon: Icon(
                CupertinoIcons.xmark_circle,
                size: 14,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
              label: Text(
                'Clear',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
        ],
      ),
    );
  }

  bool get _hasActiveFilters =>
      filter.difficulty != null || filter.status != null || filter.isFavorite;

  void _toggleDifficulty(String difficulty) {
    onFilterChanged(
      filter.copyWith(
        difficulty: () =>
            filter.difficulty == difficulty ? null : difficulty,
      ),
    );
  }

  void _toggleStatus(String status) {
    onFilterChanged(
      filter.copyWith(
        status: () => filter.status == status ? null : status,
      ),
    );
  }

  void _toggleFavorite() {
    onFilterChanged(
      filter.copyWith(isFavorite: !filter.isFavorite),
    );
  }

  void _clearFilters() {
    onFilterChanged(
      filter.copyWith(
        difficulty: () => null,
        status: () => null,
        tagSlugs: () => null,
        isFavorite: false,
      ),
    );
  }
}

class _FilterChip extends StatefulWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  State<_FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<_FilterChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.color.withValues(alpha: 0.15)
                : _isHovered
                    ? (isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.black.withValues(alpha: 0.05))
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: widget.isSelected
                  ? widget.color.withValues(alpha: 0.5)
                  : isDark
                      ? ColorPalette.darkDivider
                      : ColorPalette.lightDivider,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 12,
                  color: widget.isSelected
                      ? widget.color
                      : Theme.of(context).textTheme.bodySmall?.color,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isSelected
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: widget.isSelected
                      ? widget.color
                      : Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
