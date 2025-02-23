import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1, // Show function calls in log
      errorMethodCount: 5,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // ✅ Updated format
    ),
  );

  void info(String message) {
    _logger.i(_formatMessage("INFO", message));
  }

  void debug(String message) {
    _logger.d(_formatMessage("DEBUG", message));
  }

  void warning(String message) {
    _logger.w(_formatMessage("WARNING", message));
  }

  void error(
    String message,
    Object e, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      _formatMessage("ERROR", message),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// ✅ Custom formatter to make logs appear in a box
  String _formatMessage(String level, String message) {
    final border = "═" * (message.length + 10); // Adjust box width
    return """
╔$border╗
║  📌 [$level] $message  
╚$border╝
""";
  }
}
