import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

import '../../../../core/database/daos/submission_dao.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/leetcode_api_client.dart';
import '../../domain/entities/code_execution_result.dart';
import '../../domain/repositories/code_execution_repository.dart';

class CodeExecutionRepositoryImpl implements CodeExecutionRepository {
  CodeExecutionRepositoryImpl({
    required this.apiClient,
    required this.submissionDao,
  });

  final LeetCodeApiClient apiClient;
  final SubmissionDao submissionDao;

  @override
  Future<Either<Failure, CodeExecutionResult>> runCode({
    required String titleSlug,
    required String code,
    required String language,
    required String testCases,
    required String questionId,
  }) async {
    try {
      final response = await apiClient.runCode(
        titleSlug: titleSlug,
        code: code,
        language: language,
        testCases: testCases,
        questionId: questionId,
      );

      final interpretId = response['interpret_id'] as String?;
      if (interpretId == null) {
        return const Left(
          ServerFailure(message: 'Failed to get interpret ID'),
        );
      }

      final result = await apiClient.pollSubmissionResult(interpretId);
      return Right(_mapResult(result));
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CodeExecutionResult>> submitCode({
    required String titleSlug,
    required String code,
    required String language,
    required String questionId,
  }) async {
    try {
      final response = await apiClient.submitSolution(
        titleSlug: titleSlug,
        code: code,
        language: language,
        questionId: questionId,
      );

      final submissionId = response['submission_id']?.toString();
      if (submissionId == null) {
        return const Left(
          ServerFailure(message: 'Failed to get submission ID'),
        );
      }

      final result = await apiClient.pollSubmissionResult(submissionId);
      final executionResult = _mapResult(result, submissionId: submissionId);

      // Save submission to local database
      await _saveSubmission(
        submissionId: submissionId,
        titleSlug: titleSlug,
        questionId: questionId,
        code: code,
        language: language,
        result: executionResult,
      );

      return Right(executionResult);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  CodeExecutionResult _mapResult(
    Map<String, dynamic> data, {
    String? submissionId,
  }) {
    return CodeExecutionResult(
      state: data['state'] as String? ?? 'UNKNOWN',
      statusCode: data['status_code'] as int?,
      statusMessage: data['status_msg'] as String?,
      statusRuntime: data['status_runtime'] as String?,
      statusMemory: data['status_memory'] as String?,
      runtimePercentile:
          (data['runtime_percentile'] as num?)?.toDouble(),
      memoryPercentile:
          (data['memory_percentile'] as num?)?.toDouble(),
      totalCorrect: data['total_correct'] as int?,
      totalTestcases: data['total_testcases'] as int?,
      codeAnswer: (data['code_answer'] as List<dynamic>?)?.cast<String>(),
      expectedAnswer:
          (data['expected_code_answer'] as List<dynamic>?)?.cast<String>(),
      compileError: data['compile_error'] as String?,
      runtimeError: data['runtime_error'] as String?,
      lastTestcase: data['last_testcase'] as String?,
      stdOutput: data['std_output'] as String?,
      submissionId: submissionId,
    );
  }

  Future<void> _saveSubmission({
    required String submissionId,
    required String titleSlug,
    required String questionId,
    required String code,
    required String language,
    required CodeExecutionResult result,
  }) async {
    await submissionDao.insertSubmission(
      SubmissionsTableCompanion(
        id: Value(int.tryParse(submissionId) ?? 0),
        problemId: Value(int.tryParse(questionId) ?? 0),
        titleSlug: Value(titleSlug),
        title: Value(titleSlug.replaceAll('-', ' ')),
        lang: Value(language),
        code: Value(code),
        statusDisplay: Value(result.statusMessage ?? 'Unknown'),
        statusCode: Value(result.statusCode),
        runtime: Value(result.statusRuntime),
        runtimePercentile: Value(result.runtimePercentile),
        memory: Value(result.statusMemory),
        memoryPercentile: Value(result.memoryPercentile),
        totalCorrect: Value(result.totalCorrect),
        totalTestcases: Value(result.totalTestcases),
        timestamp: Value(DateTime.now().millisecondsSinceEpoch ~/ 1000),
      ),
    );
  }
}
