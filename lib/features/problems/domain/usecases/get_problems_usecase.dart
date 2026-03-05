import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/problem_entity.dart';
import '../entities/problem_filter.dart';
import '../repositories/problem_repository.dart';

class GetProblemsUseCase extends UseCase<List<Problem>, ProblemFilter> {
  GetProblemsUseCase(this._repository);

  final ProblemRepository _repository;

  @override
  Future<Either<Failure, List<Problem>>> call(ProblemFilter params) {
    return _repository.getProblems(params);
  }
}
