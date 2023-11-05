import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionBody extends StatelessWidget {
  const IntroductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntroductionBackground(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'introduction'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      height: 1.25,
                      fontSize: 24.sp,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.w,
                  bottom: 64.w,
                ),
                child: Text(
                  'introduction_desc'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
