import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/application/emotion_sense_cupertino.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/application/emotion_sense_material.dart';
import 'package:emotion_sense_mobile_app/src/foundation/foundation.dart';
import 'package:flutter/material.dart';

Future<void> entry() async {
  await bootstrap();

  switch (detectedPlatform) {
    case (DetectedPlatform.unexpected):
      {
        return;
      }
    case (DetectedPlatform.android || DetectedPlatform.desktop):
      {
        return runApp(
          const EmotionSenseMaterial(),
        );
      }
    case (DetectedPlatform.ios || DetectedPlatform.macos):
      {
        return runApp(
          const EmotionSenseCupertino(),
        );
      }
  }
}
