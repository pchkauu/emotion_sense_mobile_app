import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionFloatingButton extends StatelessWidget {
  const IntroductionFloatingButton({
    super.key,
  });

  Future<void> onPressed(BuildContext context) async {
    context.router.replace(const Recognition());

    final permissionGranted =
        await PermissionHandler.checkCameraPermissionGranted();

    L.info(
      message: 'Camera Permission Granted is $permissionGranted',
    );

    if (permissionGranted) {
      context.router.pop(const Introduction());

      return;
    } else {
      PermissionHandler.requestCameraPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: PrimaryElevatedButton(
        text: 'button.next'.tr(),
        callback: () => onPressed(context),
      ),
    );
  }
}
