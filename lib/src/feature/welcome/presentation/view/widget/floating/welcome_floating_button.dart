import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeFloatingButton extends StatelessWidget {
  const WelcomeFloatingButton({
    super.key,
  });

  Future<void> onPressed(BuildContext context) async {
    context.router.replace(const Introduction());
    return;

    final permissionGranted =
        await PermissionHandler.checkCameraPermissionGranted();

    L.info(
      message: 'Camera Permission Granted is $permissionGranted',
    );

    if (permissionGranted) {
      context.router.pop(const Introduction());

      return;
    } else {
      await PermissionHandler.requestCameraPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: PrimaryElevatedButton(
        text: 'button.start'.tr(),
        callback: () => onPressed(context),
      ),
    );
  }
}
