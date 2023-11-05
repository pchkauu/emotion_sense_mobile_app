import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmotionSenseCupertino extends StatelessWidget {
  const EmotionSenseCupertino({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocale,
      path: localePath,
      fallbackLocale: fallbackLocale,
      child: ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: minTextAdapt,
          splitScreenMode: splitScreenMode,
          builder: (context, child) {
            return CupertinoApp.router(
              debugShowCheckedModeBanner: false,
              title: appName,
              theme: primaryCupertinoTheme,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              routerConfig: router,
            );
          }),
    );
  }
}
