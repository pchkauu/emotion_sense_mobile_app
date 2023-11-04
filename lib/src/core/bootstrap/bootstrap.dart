import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/foundation/platform/platform.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  switch (detectedPlatform) {
    case (DetectedPlatform.unexpected):
      {
        L.fatal(
          message: 'Unexpected Platform',
          error: null,
          stackTrace: null,
        );

        return;
      }
    case (DetectedPlatform.android || DetectedPlatform.ios):
      {
        await mobileBootstrap();
      }
    case (DetectedPlatform.desktop || DetectedPlatform.macos):
      {
        await desktopBootstrap();
      }
  }

  return await configureDependencies();
}

Future<void> mobileBootstrap() async {}

Future<void> desktopBootstrap() async {}
