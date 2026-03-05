import 'package:logger/logger.dart';

final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 80,
  ),
);

class AppLogger {
  const AppLogger._();

  static void debug(String message) => appLogger.d(message);
  static void info(String message) => appLogger.i(message);
  static void warning(String message) => appLogger.w(message);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      appLogger.e(message, error: error, stackTrace: stackTrace);
}
