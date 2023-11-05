import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionFloatingButton extends StatelessWidget {
  const IntroductionFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                12.r,
              ),
            ),
          ),
        ),
        onPressed: () async {
          context.router.replace(const Recognition());

          final permissionGranted =
              await PermissionHandler.checkCameraPermissionGranted();

          L.info(
            message: 'Camera Permission Granted is $permissionGranted',
          );

          if (permissionGranted) {
            context.router.pop(const Recognition());

            return;
          } else {
            PermissionHandler.requestCameraPermission();
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 76.h,
          child: Center(
            child: Text(
              'button.next'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
