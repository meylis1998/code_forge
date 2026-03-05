import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/code_execution_result.dart';

abstract class CodeExecutionRepository {
  Future<Either<Failure, CodeExecutionResult>> runCode({
    required String titleSlug,
    required String code,
    required String language,
    required String testCases,
    required String questionId,
  });

  Future<Either<Failure, CodeExecutionResult>> submitCode({
    required String titleSlug,
    required String code,
    required String language,
    required String questionId,
  });
}
