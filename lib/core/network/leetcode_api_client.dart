import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../errors/exceptions.dart';
import '../utils/app_logger.dart';
import 'network_info.dart';

class LeetCodeApiClient {
  LeetCodeApiClient({
    required Dio dio,
    required NetworkInfo networkInfo,
  })  : _dio = dio,
        _networkInfo = networkInfo;

  final Dio _dio;
  final NetworkInfo _networkInfo;

  // GraphQL request
  Future<Map<String, dynamic>> graphql({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    return _executeRequest<Map<String, dynamic>>(() async {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.graphqlEndpoint,
        data: {
          'query': query,
          if (variables != null) 'variables': variables,
        },
      );
      return response;
    });
  }

  // Run code (interpret_solution)
  Future<Map<String, dynamic>> runCode({
    required String titleSlug,
    required String code,
    required String language,
    required String testCases,
    required String questionId,
  }) async {
    return _executeRequest<Map<String, dynamic>>(() async {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.runCode(titleSlug),
        data: {
          'lang': language,
          'question_id': questionId,
          'typed_code': code,
          'data_input': testCases,
        },
        options: Options(
          headers: {
            ApiConstants.refererHeader:
                '${ApiConstants.baseUrl}/problems/$titleSlug/',
          },
        ),
      );
      return response;
    });
  }

  // Submit solution
  Future<Map<String, dynamic>> submitSolution({
    required String titleSlug,
    required String code,
    required String language,
    required String questionId,
  }) async {
    return _executeRequest<Map<String, dynamic>>(() async {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.submitCode(titleSlug),
        data: {
          'lang': language,
          'question_id': questionId,
          'typed_code': code,
        },
        options: Options(
          headers: {
            ApiConstants.refererHeader:
                '${ApiConstants.baseUrl}/problems/$titleSlug/',
          },
        ),
      );
      return response;
    });
  }

  // Check submission status (polling)
  Future<Map<String, dynamic>> checkSubmission(String submissionId) async {
    return _executeRequest<Map<String, dynamic>>(() async {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.checkSubmission(submissionId),
      );
      return response;
    });
  }

  // Poll for submission result with exponential backoff
  Future<Map<String, dynamic>> pollSubmissionResult(
    String submissionId,
  ) async {
    var delay = ApiConstants.initialPollDelay;

    for (var i = 0; i < ApiConstants.maxPollAttempts; i++) {
      await Future<void>.delayed(delay);

      final result = await checkSubmission(submissionId);
      final state = result['state'] as String?;

      if (state == 'SUCCESS') {
        return result;
      }

      if (state != 'PENDING' && state != 'STARTED') {
        return result;
      }

      delay = Duration(
        milliseconds:
            (delay.inMilliseconds * ApiConstants.pollBackoffMultiplier).toInt(),
      );
      if (delay > ApiConstants.maxPollDelay) {
        delay = ApiConstants.maxPollDelay;
      }
    }

    throw const ServerException(
      message: 'Submission check timed out after maximum poll attempts',
    );
  }

  Future<T> _executeRequest<T>(
    Future<Response<T>> Function() request,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      throw const NetworkException(
        message: 'No internet connection available',
      );
    }

    try {
      final response = await request();

      if (response.data == null) {
        throw const ServerException(message: 'API returned null response');
      }

      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    AppLogger.error('DioException: ${e.message}', e);

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: 'Connection timed out');
      case DioExceptionType.connectionError:
        return const NetworkException(message: 'Connection error');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return AuthException(
            message: 'Authentication failed. Please update your session.',
            statusCode: statusCode,
          );
        }
        if (statusCode == 429) {
          return const RateLimitException(
            message: 'Rate limited. Please try again later.',
          );
        }
        return ServerException(
          message: e.response?.statusMessage ?? 'Server error',
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return const ServerException(message: 'Request cancelled');
      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'Bad certificate');
      case DioExceptionType.unknown:
        return ServerException(
          message: e.message ?? 'Unknown error occurred',
        );
    }
  }
}
