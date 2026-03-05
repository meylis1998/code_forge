class AppConstants {
  const AppConstants._();

  static const String appName = 'CodeForge';
  static const String appVersion = '1.0.0';

  // Window
  static const double minWindowWidth = 1024;
  static const double minWindowHeight = 768;
  static const double defaultWindowWidth = 1400;
  static const double defaultWindowHeight = 900;

  // Sidebar
  static const double sidebarWidth = 220;
  static const double sidebarCollapsedWidth = 64;

  // Pagination
  static const int problemsPageSize = 50;
  static const int submissionsPageSize = 20;

  // Editor
  static const double defaultFontSize = 14;
  static const int defaultTabSize = 4;
  static const String defaultLanguage = 'python3';
  static const String defaultEditorTheme = 'monokai';

  // Search
  static const Duration searchDebounce = Duration(milliseconds: 400);

  // Secure storage keys
  static const String leetcodeSessionKey = 'leetcode_session';
  static const String csrfTokenKey = 'csrf_token';
  static const String usernameKey = 'username';
}
