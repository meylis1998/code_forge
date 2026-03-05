import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import '../../storage/secure_storage_helper.dart';

class CookieInterceptor extends Interceptor {
  CookieInterceptor(this._secureStorage);

  final SecureStorageHelper _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = await _secureStorage.getLeetCodeSession();
    final csrfToken = await _secureStorage.getCsrfToken();

    if (session != null && csrfToken != null) {
      options.headers[ApiConstants.cookieHeader] =
          'LEETCODE_SESSION=$session; csrftoken=$csrfToken';
      options.headers[ApiConstants.csrfHeader] = csrfToken;
      options.headers[ApiConstants.refererHeader] = ApiConstants.baseUrl;
    }

    handler.next(options);
  }
}
