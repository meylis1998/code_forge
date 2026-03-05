import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/problem_entity.dart';
import '../../domain/entities/problem_filter.dart';
import '../../domain/repositories/problem_repository.dart';
import '../datasources/problem_local_data_source.dart';
import '../datasources/problem_remote_data_source.dart';

class ProblemRepositoryImpl implements ProblemRepository {
  ProblemRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final ProblemLocalDataSource localDataSource;
  final ProblemRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Problem>>> getProblems(
    ProblemFilter filter,
  ) async {
    try {
      final problems = await localDataSource.getProblems(filter);
      return Right(problems);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, int>> getProblemsCount(ProblemFilter filter) async {
    try {
      final count = await localDataSource.getProblemsCount(filter);
      return Right(count);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Problem>> getProblemDetail(String titleSlug) async {
    try {
      // Try to get from local first
      final localProblem = await localDataSource.getProblemBySlug(titleSlug);

      if (localProblem != null && localProblem.content != null) {
        return Right(localProblem);
      }

      // Fetch from remote if we don't have content
      if (await networkInfo.isConnected) {
        try {
          final remoteProblem =
              await remoteDataSource.getProblemDetail(titleSlug);

          // Cache locally
          await localDataSource.saveProblems([remoteProblem]);
          if (remoteProblem.codeSnippets.isNotEmpty) {
            await localDataSource.saveCodeSnippets(
              remoteProblem.id,
              remoteProblem.codeSnippets,
            );
          }

          return Right(remoteProblem);
        } on AuthException {
          // If not authenticated, return local data if available
          if (localProblem != null) return Right(localProblem);
          return const Left(
            AuthFailure(message: 'Authentication required for problem details'),
          );
        }
      }

      if (localProblem != null) return Right(localProblem);

      return const Left(
        CacheFailure(message: 'Problem not found and offline'),
      );
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TopicTag>>> getAllTags() async {
    try {
      final tags = await localDataSource.getAllTags();
      return Right(tags);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> syncProblemsFromRemote() async {
    try {
      if (!await networkInfo.isConnected) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      }

      // Fetch problems in batches
      var skip = 0;
      const limit = 100;
      var hasMore = true;

      while (hasMore) {
        final problems = await remoteDataSource.getProblems(
          limit: limit,
          skip: skip,
        );

        if (problems.isEmpty) {
          hasMore = false;
        } else {
          await localDataSource.saveProblems(problems);
          skip += limit;
        }
      }

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> seedProblemsFromJson() async {
    try {
      final hasProblems = await localDataSource.hasProblems();
      if (!hasProblems) {
        await localDataSource.seedFromJson();
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
