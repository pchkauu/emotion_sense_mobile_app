import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/foundation/platform/platform.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  EquatableConfig.stringify = true;

  switch (detectedPlatform) {
    case (DetectedPlatform.unexpected):
      {
        L.fatal(
          message: 'Unexpected Platform',
          error: null,
          stackTrace: null,
        );

        throw Error();
      }
    case (DetectedPlatform.android || DetectedPlatform.ios):
      {
        await mobileBootstrap();
      }
    case (DetectedPlatform.desktop || DetectedPlatform.macos):
      {
        L.fatal(
          message: 'Unsupported Platform',
          error: null,
          stackTrace: null,
        );

        // throw Error();
      }
  }

  return await configureDependencies();
}

Future<void> mobileBootstrap() async {
  await WakelockPlus.enable();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> desktopBootstrap() async {
  return;
}
