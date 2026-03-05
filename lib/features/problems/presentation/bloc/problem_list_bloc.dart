import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/problem_entity.dart';
import '../../domain/entities/problem_filter.dart';
import '../../domain/usecases/get_problems_usecase.dart';

part 'problem_list_event.dart';
part 'problem_list_state.dart';

class ProblemListBloc extends Bloc<ProblemListEvent, ProblemListState> {
  ProblemListBloc({
    required GetProblemsUseCase getProblems,
  })  : _getProblems = getProblems,
        super(const ProblemListState()) {
    on<ProblemListFetched>(
      _onFetched,
    );
    on<ProblemListSearchChanged>(
      _onSearchChanged,
      transformer: (events, mapper) => events
          .debounceTime(AppConstants.searchDebounce)
          .asyncExpand(mapper),
    );
    on<ProblemListFilterChanged>(_onFilterChanged);
    on<ProblemListLoadMore>(_onLoadMore);
    on<ProblemListRefreshed>(_onRefreshed);
  }

  final GetProblemsUseCase _getProblems;

  Future<void> _onFetched(
    ProblemListFetched event,
    Emitter<ProblemListState> emit,
  ) async {
    emit(state.copyWith(status: ProblemListStatus.loading));

    final result = await _getProblems(state.filter);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProblemListStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (problems) => emit(
        state.copyWith(
          status: ProblemListStatus.success,
          problems: problems,
          hasReachedMax: problems.length < state.filter.pageSize,
        ),
      ),
    );
  }

  Future<void> _onSearchChanged(
    ProblemListSearchChanged event,
    Emitter<ProblemListState> emit,
  ) async {
    final newFilter = state.filter.copyWith(
      searchQuery: () => event.query.isEmpty ? null : event.query,
      page: 0,
    );

    emit(state.copyWith(
      filter: newFilter,
      status: ProblemListStatus.loading,
    ));

    final result = await _getProblems(newFilter);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProblemListStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (problems) => emit(
        state.copyWith(
          status: ProblemListStatus.success,
          problems: problems,
          hasReachedMax: problems.length < newFilter.pageSize,
        ),
      ),
    );
  }

  Future<void> _onFilterChanged(
    ProblemListFilterChanged event,
    Emitter<ProblemListState> emit,
  ) async {
    final newFilter = event.filter.copyWith(page: 0);

    emit(state.copyWith(
      filter: newFilter,
      status: ProblemListStatus.loading,
    ));

    final result = await _getProblems(newFilter);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProblemListStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (problems) => emit(
        state.copyWith(
          status: ProblemListStatus.success,
          problems: problems,
          hasReachedMax: problems.length < newFilter.pageSize,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    ProblemListLoadMore event,
    Emitter<ProblemListState> emit,
  ) async {
    if (state.hasReachedMax || state.status == ProblemListStatus.loading) {
      return;
    }

    final newFilter = state.filter.copyWith(
      page: state.filter.page + 1,
    );

    final result = await _getProblems(newFilter);

    result.fold(
      (failure) => emit(
        state.copyWith(errorMessage: failure.message),
      ),
      (problems) => emit(
        state.copyWith(
          filter: newFilter,
          problems: [...state.problems, ...problems],
          hasReachedMax: problems.length < newFilter.pageSize,
        ),
      ),
    );
  }

  Future<void> _onRefreshed(
    ProblemListRefreshed event,
    Emitter<ProblemListState> emit,
  ) async {
    final newFilter = state.filter.copyWith(page: 0);

    emit(state.copyWith(
      filter: newFilter,
      status: ProblemListStatus.loading,
    ));

    final result = await _getProblems(newFilter);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProblemListStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (problems) => emit(
        state.copyWith(
          status: ProblemListStatus.success,
          problems: problems,
          hasReachedMax: problems.length < newFilter.pageSize,
        ),
      ),
    );
  }
}
