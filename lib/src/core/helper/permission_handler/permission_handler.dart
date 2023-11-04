import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestCameraPermission() async {
    return await Permission.camera.request().isGranted;
  }

  static Future<bool> checkCameraPermissionGranted() async {
    return await Permission.camera.status.isGranted;
  }
}
