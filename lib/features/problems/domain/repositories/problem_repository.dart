import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/problem_entity.dart';
import '../entities/problem_filter.dart';

abstract class ProblemRepository {
  Future<Either<Failure, List<Problem>>> getProblems(ProblemFilter filter);

  Future<Either<Failure, int>> getProblemsCount(ProblemFilter filter);

  Future<Either<Failure, Problem>> getProblemDetail(String titleSlug);

  Future<Either<Failure, List<TopicTag>>> getAllTags();

  Future<Either<Failure, void>> syncProblemsFromRemote();

  Future<Either<Failure, void>> seedProblemsFromJson();

  Future<Either<Failure, void>> toggleFavorite(int problemId);
}
