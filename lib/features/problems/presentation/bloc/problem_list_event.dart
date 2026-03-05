part of 'problem_list_bloc.dart';

abstract class ProblemListEvent extends Equatable {
  const ProblemListEvent();

  @override
  List<Object?> get props => [];
}

class ProblemListFetched extends ProblemListEvent {}

class ProblemListSearchChanged extends ProblemListEvent {
  const ProblemListSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class ProblemListFilterChanged extends ProblemListEvent {
  const ProblemListFilterChanged(this.filter);

  final ProblemFilter filter;

  @override
  List<Object?> get props => [filter];
}

class ProblemListLoadMore extends ProblemListEvent {}

class ProblemListRefreshed extends ProblemListEvent {}

class ProblemListFavoriteToggled extends ProblemListEvent {
  const ProblemListFavoriteToggled(this.problemId);

  final int problemId;

  @override
  List<Object?> get props => [problemId];
}
