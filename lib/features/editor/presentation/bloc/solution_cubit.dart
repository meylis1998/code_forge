import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../problems/domain/repositories/problem_repository.dart';
import '../../domain/entities/solution.dart';

part 'solution_state.dart';

class SolutionCubit extends Cubit<SolutionState> {
  SolutionCubit({required ProblemRepository problemRepository})
    : _problemRepository = problemRepository,
      super(const SolutionState());

  final ProblemRepository _problemRepository;

  Future<void> loadSolution(String titleSlug) async {
    emit(state.copyWith(status: SolutionStatus.loading));

    final result = await _problemRepository.getSolution(titleSlug);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SolutionStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (solution) => emit(
        state.copyWith(
          status: SolutionStatus.loaded,
          solution: solution,
        ),
      ),
    );
  }
}
