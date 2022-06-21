import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';
import 'package:weather_app/presentations/widgets/button/primary_button.dart';

class CustomDialog {
  static void showErrorDialog(
      {required String message,
      String label = "Close",
      String? header,
      VoidCallback? onPressed}) {
    Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        contentPadding: const EdgeInsets.all(20),
        radius: 6,
        title: header ?? "Header",
        titleStyle:
            AppText.kSubheadingBold.copyWith(color: AppColor.kBlackSoftColor),
        content: Column(
          children: [
            Icon(
              Icons.warning_rounded,
              color: AppColor.kYellowColor,
              size: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppText.kBody.copyWith(color: AppColor.kBlackSoftColor),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
        actions: [
          PrimaryButton(
            onPressed: onPressed ?? () {},
            label: label,
          )
        ]);
  }
}
