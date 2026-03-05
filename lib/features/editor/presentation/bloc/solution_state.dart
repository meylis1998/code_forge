part of 'solution_cubit.dart';

enum SolutionStatus { initial, loading, loaded, error }

class SolutionState extends Equatable {
  const SolutionState({
    this.status = SolutionStatus.initial,
    this.solution,
    this.errorMessage,
  });

  final SolutionStatus status;
  final Solution? solution;
  final String? errorMessage;

  bool get hasSolution => solution != null;

  SolutionState copyWith({
    SolutionStatus? status,
    Solution? solution,
    String? errorMessage,
  }) {
    return SolutionState(
      status: status ?? this.status,
      solution: solution ?? this.solution,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, solution, errorMessage];
}
