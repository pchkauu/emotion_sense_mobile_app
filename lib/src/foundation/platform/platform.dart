import 'dart:io';

final detectedPlatform = Foundation.detectPlatform();

enum DetectedPlatform {
  unexpected,
  android,
  ios,
  desktop,
  macos,
}

extension Foundation on Platform {
  static DetectedPlatform detectPlatform() {
    if (Platform.isAndroid) {
      return DetectedPlatform.android;
    }

    if (Platform.isIOS) {
      return DetectedPlatform.ios;
    }

    if (Platform.isLinux || Platform.isWindows) {
      return DetectedPlatform.desktop;
    }

    if (Platform.isMacOS) {
      return DetectedPlatform.macos;
    }

    return DetectedPlatform.unexpected;
  }
}
