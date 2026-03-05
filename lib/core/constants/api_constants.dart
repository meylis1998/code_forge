class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://leetcode.com';
  static const String graphqlEndpoint = '$baseUrl/graphql';

  // REST endpoints
  static String runCode(String titleSlug) =>
      '$baseUrl/problems/$titleSlug/interpret_solution/';
  static String submitCode(String titleSlug) =>
      '$baseUrl/problems/$titleSlug/submit/';
  static String checkSubmission(String submissionId) =>
      '$baseUrl/submissions/detail/$submissionId/check/';

  // Headers
  static const String refererHeader = 'Referer';
  static const String csrfHeader = 'x-csrftoken';
  static const String cookieHeader = 'Cookie';
  static const String contentType = 'application/json';
  static const String origin = 'https://leetcode.com';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Polling
  static const Duration initialPollDelay = Duration(seconds: 1);
  static const Duration maxPollDelay = Duration(seconds: 10);
  static const int maxPollAttempts = 30;
  static const double pollBackoffMultiplier = 1.5;
}
