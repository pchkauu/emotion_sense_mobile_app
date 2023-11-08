import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

@RoutePage(name: 'Study')
class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RecognitionBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'training.headline'.tr(),
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                'assets/ui_kit/emotion/happy.svg',
                width: MediaQuery.of(context).size.width / 2,
              ),
              Text(
                'training.subheadline'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(height: 1.5),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  showAsBottomSheet(context);
                },
                child: Text(
                  'button.start'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 32.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAsBottomSheet(BuildContext context) async {
    final result = await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return SizedBox(
            height: 200.h,
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.pop(context, 'This is the result.'),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'sorry'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });

    print(result); // This is the result.
  }
}
