import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'Static')
class StaticPage extends StatelessWidget {
  const StaticPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'static.headline'.tr(),
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          'static.subheadline'.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        Text(
          'static.description'.tr(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        Lottie.asset('assets/ui_kit/lottie/upload.json',
            width: 128.w, frameRate: FrameRate(140)),
        TextButton(
          onPressed: () {},
          child: Text(
            'button.load'.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 32.sp,
                ),
          ),
        ),
      ],
    );
  }
}
