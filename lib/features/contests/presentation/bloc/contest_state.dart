part of 'contest_bloc.dart';

enum ContestStatus { initial, loading, loaded, error }

class ContestState extends Equatable {
  const ContestState({
    this.status = ContestStatus.initial,
    this.contests = const [],
    this.errorMessage,
  });

  final ContestStatus status;
  final List<Contest> contests;
  final String? errorMessage;

  List<Contest> get upcoming =>
      contests.where((c) => c.isUpcoming || c.isOngoing).toList()
        ..sort((a, b) => a.startTime.compareTo(b.startTime));

  List<Contest> get past =>
      contests.where((c) => c.isPast).toList();

  Contest? get nextContest => upcoming.isNotEmpty ? upcoming.first : null;

  ContestState copyWith({
    ContestStatus? status,
    List<Contest>? contests,
    String? errorMessage,
  }) {
    return ContestState(
      status: status ?? this.status,
      contests: contests ?? this.contests,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, contests, errorMessage];
}
