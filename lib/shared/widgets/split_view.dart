import 'package:flutter/material.dart';

import '../../core/theme/color_palette.dart';

class SplitView extends StatefulWidget {
  const SplitView({
    required this.left,
    required this.right,
    this.initialRatio = 0.45,
    this.minRatio = 0.25,
    this.maxRatio = 0.75,
    super.key,
  });

  final Widget left;
  final Widget right;
  final double initialRatio;
  final double minRatio;
  final double maxRatio;

  @override
  State<SplitView> createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> {
  late double _ratio;

  @override
  void initState() {
    super.initState();
    _ratio = widget.initialRatio;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final dividerWidth = 6.0;
        final leftWidth = (maxWidth - dividerWidth) * _ratio;
        final rightWidth = maxWidth - leftWidth - dividerWidth;

        return Row(
          children: [
            SizedBox(width: leftWidth, child: widget.left),
            MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _ratio += details.delta.dx / maxWidth;
                    _ratio = _ratio.clamp(widget.minRatio, widget.maxRatio);
                  });
                },
                child: Container(
                  width: dividerWidth,
                  color: isDark
                      ? ColorPalette.darkDivider
                      : ColorPalette.lightDivider,
                  child: Center(
                    child: Container(
                      width: 2,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.2)
                            : Colors.black.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: rightWidth, child: widget.right),
          ],
        );
      },
    );
  }
}
