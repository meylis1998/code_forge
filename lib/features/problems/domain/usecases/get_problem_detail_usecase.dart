import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/problem_entity.dart';
import '../repositories/problem_repository.dart';

class GetProblemDetailUseCase extends UseCase<Problem, String> {
  GetProblemDetailUseCase(this._repository);

  final ProblemRepository _repository;

  @override
  Future<Either<Failure, Problem>> call(String params) {
    return _repository.getProblemDetail(params);
  }
}
