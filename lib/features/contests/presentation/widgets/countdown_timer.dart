import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({required this.targetTime, super.key});

  final DateTime targetTime;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  void _updateRemaining() {
    final now = DateTime.now();
    setState(() {
      _remaining = widget.targetTime.difference(now);
      if (_remaining.isNegative) _remaining = Duration.zero;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours.remainder(24);
    final minutes = _remaining.inMinutes.remainder(60);
    final seconds = _remaining.inSeconds.remainder(60);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (days > 0) ...[
          _TimeUnit(value: days, label: 'd'),
          const SizedBox(width: 4),
        ],
        _TimeUnit(value: hours, label: 'h'),
        const SizedBox(width: 4),
        _TimeUnit(value: minutes, label: 'm'),
        const SizedBox(width: 4),
        _TimeUnit(value: seconds, label: 's'),
      ],
    );
  }
}

class _TimeUnit extends StatelessWidget {
  const _TimeUnit({required this.value, required this.label});

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorPalette.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '${value.toString().padLeft(2, '0')}$label',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: 'JetBrains Mono',
          color: ColorPalette.primary,
        ),
      ),
    );
  }
}
