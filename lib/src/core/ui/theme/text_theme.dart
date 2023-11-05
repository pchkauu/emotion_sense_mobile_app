import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final primaryTextTheme = TextTheme(
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall,
  titleLarge: titleLarge,
  displayLarge: displayLarge,
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
  labelLarge: labelLarge,
  labelMedium: labelMedium,
);

const primaryFontFamily = 'Nunito Sans';

const MaterialColor primaryTextColor = MaterialColor(0xFF10182B, {
  50: Color(0xff10182B),
  100: Color(0xff10182B),
  200: Color(0xff10182B),
  300: Color(0xff10182B),
  400: Color(0xff10182B),
  500: Color(0xff10182B),
  600: Color(0xff10182B),
  700: Color(0xff10182B),
  800: Color(0xff10182B),
  900: Color(0xff10182B),
});

final headlineLarge = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 32.sp,
  color: primaryTextColor,
);

final headlineMedium = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w700,
  fontSize: 20.sp,
  color: primaryTextColor,
);

final headlineSmall = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w700,
  fontSize: 20.sp,
  color: primaryTextColor,
);

final titleLarge = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 20.sp,
);

final bodyLarge = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 20.sp,
  color: primaryTextColor,
);

final bodyMedium = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  color: primaryTextColor,
);

final bodySmall = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 14.sp,
  color: primaryTextColor,
);

final labelLarge = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 20.sp,
  color: colorBlue,
);

final labelMedium = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
  color: colorBlue,
);

final displayLarge = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,
  color: primaryTextColor,
);
