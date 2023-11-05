import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
          'static'.tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'static_desc'.tr(),
        ),
        Lottie.asset('assets/ui_kit/lottie/loading.json'),
        TextButton(
          onPressed: () {},
          child: Text(
            'button.static.load'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
