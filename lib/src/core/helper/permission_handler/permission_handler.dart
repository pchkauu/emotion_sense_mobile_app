import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestCameraPermission() async {
    await Permission.photos.request().isGranted;

    return checkCameraPermissionGranted();
  }

  static Future<bool> checkCameraPermissionGranted() async {
    return await Permission.camera.status.isGranted;
  }
}
