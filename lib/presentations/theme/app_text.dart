import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_color.dart';

class AppText {
  static TextStyle get kButtonLabel => const TextStyle(
      fontFamily: 'MavenPro',
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      height: 1.06);

  static TextStyle get kLabel => TextStyle(
      fontFamily: 'MavenPro',
      fontSize: 13,
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w700,
      height: 1.16,
      wordSpacing: 0);

  static TextStyle get kBody => TextStyle(
      fontFamily: 'MavenPro',
      fontSize: 15,
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w400,
      height: 1.6,
      wordSpacing: 0);

  static TextStyle get kLabelSmall => TextStyle(
      fontFamily: 'MavenPro',
      fontSize: 10,
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w400,
      height: 1.6,
      wordSpacing: 0);

  static TextStyle get kSubheadingBold => TextStyle(
      fontFamily: 'MavenPro',
      fontSize: 20,
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w700,
      height: 1.4,
      wordSpacing: 0);

  static TextStyle get kBodyValue => TextStyle(
      fontFamily: 'MavenPro',
      fontSize: 18,
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w400,
      height: 1.3,
      wordSpacing: 0);
}
