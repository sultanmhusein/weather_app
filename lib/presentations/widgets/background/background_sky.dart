import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_asset.dart';

class BackgroundSky extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: AppAsset.bgSky,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover),
    );
  }
}
