import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/routers.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splash,
      getPages: Routers().routers,
    );
  }
}
