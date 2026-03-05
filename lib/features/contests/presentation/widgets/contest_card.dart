import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/contest.dart';

class ContestCard extends StatelessWidget {
  const ContestCard({required this.contest, super.key});

  final Contest contest;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dateFormat = DateFormat('MMM d, yyyy HH:mm');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Status icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _statusIcon,
                color: _statusColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contest.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: 12,
                        color: isDark
                            ? ColorPalette.darkTextSecondary
                            : ColorPalette.lightTextSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        dateFormat.format(contest.startTime.toLocal()),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        CupertinoIcons.clock,
                        size: 12,
                        color: isDark
                            ? ColorPalette.darkTextSecondary
                            : ColorPalette.lightTextSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        contest.formattedDuration,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _statusLabel,
                style: TextStyle(
                  color: _statusColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Open in browser button
            IconButton(
              onPressed: _openInBrowser,
              icon: const Icon(CupertinoIcons.arrow_up_right_square, size: 16),
              tooltip: 'Open in browser',
              iconSize: 16,
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Color get _statusColor {
    if (contest.isOngoing) return ColorPalette.medium;
    if (contest.isUpcoming) return ColorPalette.primary;
    return ColorPalette.accepted;
  }

  IconData get _statusIcon {
    if (contest.isOngoing) return CupertinoIcons.play_circle_fill;
    if (contest.isUpcoming) return CupertinoIcons.calendar;
    return CupertinoIcons.checkmark_circle_fill;
  }

  String get _statusLabel {
    if (contest.isOngoing) return 'Live';
    if (contest.isUpcoming) return 'Upcoming';
    return 'Finished';
  }

  Future<void> _openInBrowser() async {
    final url = Uri.parse(
      'https://leetcode.com/contest/${contest.titleSlug}/',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
