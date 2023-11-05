import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: 'Study')
class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'button.start'.tr(),
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 32.sp),
          ),
        ),
      ],
    );
  }
}
