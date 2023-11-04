import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:logger/logger.dart';

class L {
  static late final Logger logger;

  L() {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }

  static void fatal({
    required String? message,
    required Object? error,
    required StackTrace? stackTrace,
  }) {
    if (!isDebugMode) return;

    logger.f(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
