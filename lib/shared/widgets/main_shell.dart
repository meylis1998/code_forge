import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/color_palette.dart';

class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          _Sidebar(
            selectedIndex: navigationShell.currentIndex,
            onItemSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            isDark: isDark,
          ),
          // Divider
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: isDark
                ? ColorPalette.darkDivider
                : ColorPalette.lightDivider,
          ),
          // Content
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.selectedIndex,
    required this.onItemSelected,
    required this.isDark,
  });

  final int selectedIndex;
  final void Function(int) onItemSelected;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.sidebarWidth,
      color: isDark ? ColorPalette.darkSidebar : ColorPalette.lightSidebar,
      child: Column(
        children: [
          // Title bar drag area
          const SizedBox(height: 38),
          // App title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.chevron_left_slash_chevron_right,
                  size: 22,
                  color: ColorPalette.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  AppConstants.appName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? ColorPalette.darkTextPrimary
                        : ColorPalette.lightTextPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Navigation items
          _SidebarItem(
            icon: CupertinoIcons.list_bullet,
            label: 'Problems',
            isSelected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
            isDark: isDark,
          ),
          _SidebarItem(
            icon: CupertinoIcons.chart_bar_square,
            label: 'Dashboard',
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
            isDark: isDark,
          ),
          _SidebarItem(
            icon: CupertinoIcons.clock,
            label: 'Submissions',
            isSelected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
            isDark: isDark,
          ),
          _SidebarItem(
            icon: CupertinoIcons.flag,
            label: 'Contests',
            isSelected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
            isDark: isDark,
          ),
          const Spacer(),
          _SidebarItem(
            icon: CupertinoIcons.gear,
            label: 'Settings',
            isSelected: selectedIndex == 4,
            onTap: () => onItemSelected(4),
            isDark: isDark,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedColor = ColorPalette.primary;
    final defaultColor = widget.isDark
        ? ColorPalette.darkTextSecondary
        : ColorPalette.lightTextSecondary;
    final hoverBg = widget.isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.black.withValues(alpha: 0.05);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? selectedColor.withValues(alpha: 0.15)
                : _isHovered
                ? hoverBg
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: widget.isSelected ? selectedColor : defaultColor,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: widget.isSelected
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: widget.isSelected ? selectedColor : defaultColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
