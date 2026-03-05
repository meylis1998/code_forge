part of 'problem_list_bloc.dart';

enum ProblemListStatus { initial, loading, success, failure }

class ProblemListState extends Equatable {
  const ProblemListState({
    this.status = ProblemListStatus.initial,
    this.problems = const [],
    this.filter = const ProblemFilter(),
    this.hasReachedMax = false,
    this.errorMessage,
  });

  final ProblemListStatus status;
  final List<Problem> problems;
  final ProblemFilter filter;
  final bool hasReachedMax;
  final String? errorMessage;

  ProblemListState copyWith({
    ProblemListStatus? status,
    List<Problem>? problems,
    ProblemFilter? filter,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return ProblemListState(
      status: status ?? this.status,
      problems: problems ?? this.problems,
      filter: filter ?? this.filter,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, problems, filter, hasReachedMax, errorMessage];
}
