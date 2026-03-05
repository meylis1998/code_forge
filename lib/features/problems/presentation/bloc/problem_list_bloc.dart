import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/problem_entity.dart';
import '../../domain/entities/problem_filter.dart';
import '../../domain/repositories/problem_repository.dart';
import '../../domain/usecases/get_problems_usecase.dart';

part 'problem_list_event.dart';
part 'problem_list_state.dart';

class ProblemListBloc extends Bloc<ProblemListEvent, ProblemListState> {
  ProblemListBloc({
    required GetProblemsUseCase getProblems,
    required ProblemRepository problemRepository,
  })  : _getProblems = getProblems,
        _problemRepository = problemRepository,
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
    on<ProblemListFavoriteToggled>(_onFavoriteToggled);
  }

  final GetProblemsUseCase _getProblems;
  final ProblemRepository _problemRepository;

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

  Future<void> _onFavoriteToggled(
    ProblemListFavoriteToggled event,
    Emitter<ProblemListState> emit,
  ) async {
    await _problemRepository.toggleFavorite(event.problemId);

    // Update the problem in the current list
    final updatedProblems = state.problems.map((p) {
      if (p.id == event.problemId) {
        return Problem(
          id: p.id,
          frontendId: p.frontendId,
          title: p.title,
          titleSlug: p.titleSlug,
          difficulty: p.difficulty,
          content: p.content,
          acRate: p.acRate,
          isPaidOnly: p.isPaidOnly,
          status: p.status,
          likes: p.likes,
          dislikes: p.dislikes,
          categoryTitle: p.categoryTitle,
          hints: p.hints,
          exampleTestcases: p.exampleTestcases,
          sampleTestCase: p.sampleTestCase,
          isFavorite: !p.isFavorite,
          topicTags: p.topicTags,
          codeSnippets: p.codeSnippets,
          similarQuestions: p.similarQuestions,
          metaData: p.metaData,
          stats: p.stats,
          hasSolution: p.hasSolution,
          hasVideoSolution: p.hasVideoSolution,
        );
      }
      return p;
    }).toList();

    emit(state.copyWith(problems: updatedProblems));
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
