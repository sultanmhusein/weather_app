import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/presentations/theme/app_asset.dart';
import 'package:weather_app/presentations/widgets/background/background_sky.dart';
import 'package:weather_app/shared/routers.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Get.offAllNamed(Routers.form);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.center, children: [
          BackgroundSky(),
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image(
              image: AppAsset.logoJds,
              width: 160,
              height: 160,
            ),
          )
        ]));
  }
}
