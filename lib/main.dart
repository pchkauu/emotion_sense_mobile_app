import 'dart:async';

import 'package:emotion_sense_mobile_app/src/core/core.dart';

Future<void> main() async => runZonedGuarded(
      () async => await entry(),
      (error, stack) {
        L.fatal(
          message: globalFailureMessage,
          error: error,
          stackTrace: stack,
        );
      },
    );
