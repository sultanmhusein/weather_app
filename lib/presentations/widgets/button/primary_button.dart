import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';
import 'package:weather_app/presentations/widgets/loading/loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? label;
  final bool isDisabled;
  final void Function() onPressed;
  final bool isLoading;
  final bool isWithIcon;
  final Widget? icon;
  final bool withoutShadow;

  PrimaryButton(
      {Key? key,
      this.width,
      this.height,
      this.label,
      this.isLoading = false,
      this.isDisabled = false,
      required this.onPressed,
      this.isWithIcon = false,
      this.icon,
      this.withoutShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AnimatedSize(
        alignment: Alignment.center,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width ?? screenSize.width,
            height: height ?? 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: isDisabled ? 0 : 7,
                  shadowColor: Colors.transparent,
                  primary: AppColor.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )),
              onPressed: isDisabled ? null : onPressed,
              child: isLoading
                  ? const LoadingIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      label ?? 'Label',
                      style: AppText.kButtonLabel,
                    ),
            ),
          ),
        ));
  }
}
