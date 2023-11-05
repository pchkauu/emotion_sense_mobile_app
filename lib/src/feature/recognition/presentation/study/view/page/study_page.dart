import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          'training'.tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SvgPicture.asset(
          'assets/ui_kit/emotion/happy.svg',
          width: MediaQuery.of(context).size.width / 2,
        ),
        Text(
          'training_desc'.tr(),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'button.training.start'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
