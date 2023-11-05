import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody>
    with TickerProviderStateMixin {
  final CarouselController controller = CarouselController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WelcomeBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'app_name'.tr(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 48.sp,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 32.w,
                bottom: 64.w,
              ),
              child: Text(
                'app_desc'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            const WelcomeCarousel(),
          ],
        ),
      ),
    );
  }
}
