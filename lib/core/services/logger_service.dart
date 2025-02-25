import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1, // Show function calls in log
      errorMethodCount: 5,
      lineLength: 100,
      colors: true,
      printEmojis: true,
    ),
  );

  void info(String message) {
    _logger.i(message);
  }

  void debug(String message) {
    _logger.d(message);
  }

  void warning(String message) {
    _logger.w(message);
  }

  void error(
    String message,
    Object e, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
