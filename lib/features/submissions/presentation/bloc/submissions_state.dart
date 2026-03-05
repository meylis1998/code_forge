part of 'submissions_bloc.dart';

enum SubmissionsStatus { initial, loading, loaded, error }

class SubmissionsState extends Equatable {
  const SubmissionsState({
    this.status = SubmissionsStatus.initial,
    this.submissions = const [],
    this.hasReachedMax = false,
    this.langFilter,
    this.statusFilter,
    this.errorMessage,
  });

  final SubmissionsStatus status;
  final List<SubmissionsTableData> submissions;
  final bool hasReachedMax;
  final String? langFilter;
  final String? statusFilter;
  final String? errorMessage;

  SubmissionsState copyWith({
    SubmissionsStatus? status,
    List<SubmissionsTableData>? submissions,
    bool? hasReachedMax,
    String? langFilter,
    String? statusFilter,
    String? errorMessage,
  }) {
    return SubmissionsState(
      status: status ?? this.status,
      submissions: submissions ?? this.submissions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      langFilter: langFilter ?? this.langFilter,
      statusFilter: statusFilter ?? this.statusFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    submissions,
    hasReachedMax,
    langFilter,
    statusFilter,
    errorMessage,
  ];
}
