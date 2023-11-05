import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:logger/logger.dart';

class L {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  const L();

  static void fatal({
    required String? message,
    required Object? error,
    required StackTrace? stackTrace,
  }) {
    if (kReleaseMode) return;

    logger.f(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void info({required String? message}) {
    if (kReleaseMode) return;

    logger.i(message);
  }
}
