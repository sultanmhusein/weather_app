import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/presentations/theme/app_color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.color = AppColor.kPrimaryColor})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(color: color, size: 40);
  }
}
