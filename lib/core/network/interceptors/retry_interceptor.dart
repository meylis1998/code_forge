import 'dart:async';

import 'package:dio/dio.dart';

import '../../utils/app_logger.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] == null) {
      err.requestOptions.extra['retryCount'] = 0;
    }

    final retryCount =
        (err.requestOptions.extra['retryCount'] as int?) ?? maxRetries;

    if (_shouldRetry(err) && retryCount < maxRetries) {
      err.requestOptions.extra['retryCount'] = retryCount + 1;

      final delay = retryDelay * (retryCount + 1);
      AppLogger.warning(
        'Retrying request (${retryCount + 1}/$maxRetries) after $delay: '
        '${err.requestOptions.path}',
      );

      await Future<void>.delayed(delay);

      try {
        final response = await dio.fetch<dynamic>(err.requestOptions);
        handler.resolve(response);
        return;
      } on DioException catch (e) {
        handler.next(e);
        return;
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }
}
