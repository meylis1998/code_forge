import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/problem_entity.dart';
import '../repositories/problem_repository.dart';

class GetTagsUseCase extends UseCase<List<TopicTag>, NoParams> {
  GetTagsUseCase(this._repository);

  final ProblemRepository _repository;

  @override
  Future<Either<Failure, List<TopicTag>>> call(NoParams params) {
    return _repository.getAllTags();
  }
}
