import 'package:equatable/equatable.dart';

class Contest extends Equatable {
  const Contest({
    required this.title,
    required this.titleSlug,
    required this.startTime,
    required this.duration,
    this.isVirtual = false,
    this.containsPremium = false,
  });

  final String title;
  final String titleSlug;
  final DateTime startTime;
  final int duration; // seconds
  final bool isVirtual;
  final bool containsPremium;

  DateTime get endTime => startTime.add(Duration(seconds: duration));

  bool get isUpcoming => startTime.isAfter(DateTime.now());

  bool get isOngoing {
    final now = DateTime.now();
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  bool get isPast => endTime.isBefore(DateTime.now());

  Duration get durationObj => Duration(seconds: duration);

  String get formattedDuration {
    final hours = durationObj.inHours;
    final minutes = durationObj.inMinutes.remainder(60);
    if (hours > 0 && minutes > 0) return '${hours}h ${minutes}m';
    if (hours > 0) return '${hours}h';
    return '${minutes}m';
  }

  @override
  List<Object?> get props => [titleSlug, startTime];
}
