import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_constants.dart';

class SecureStorageHelper {
  SecureStorageHelper(this._storage);

  final FlutterSecureStorage _storage;

  // LeetCode Session
  Future<void> saveLeetCodeSession(String session) =>
      _storage.write(key: AppConstants.leetcodeSessionKey, value: session);

  Future<String?> getLeetCodeSession() =>
      _storage.read(key: AppConstants.leetcodeSessionKey);

  Future<void> deleteLeetCodeSession() =>
      _storage.delete(key: AppConstants.leetcodeSessionKey);

  // CSRF Token
  Future<void> saveCsrfToken(String token) =>
      _storage.write(key: AppConstants.csrfTokenKey, value: token);

  Future<String?> getCsrfToken() =>
      _storage.read(key: AppConstants.csrfTokenKey);

  Future<void> deleteCsrfToken() =>
      _storage.delete(key: AppConstants.csrfTokenKey);

  // Username
  Future<void> saveUsername(String username) =>
      _storage.write(key: AppConstants.usernameKey, value: username);

  Future<String?> getUsername() =>
      _storage.read(key: AppConstants.usernameKey);

  Future<void> deleteUsername() =>
      _storage.delete(key: AppConstants.usernameKey);

  // Check if authenticated
  Future<bool> get isAuthenticated async {
    final session = await getLeetCodeSession();
    final csrf = await getCsrfToken();
    return session != null && csrf != null;
  }

  // Clear all auth data
  Future<void> clearAuth() async {
    await deleteLeetCodeSession();
    await deleteCsrfToken();
    await deleteUsername();
  }
}
