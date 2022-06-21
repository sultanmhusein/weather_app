import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/injection.dart';
import 'package:weather_app/presentations/cubit/weather_cubit.dart';
import '../presentations/pages/page.dart';

class Routers {
  static const String splash = "/splash";
  static const String form = "/form";
  static const String home = "/home";

  List<GetPage> routers = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(
        name: form,
        page: () => BlocProvider(
              create: (context) => locator<WeatherCubit>(),
              child: FormPage(),
            )),
    GetPage(
        name: home,
        page: () => BlocProvider(
              create: (context) => locator<WeatherCubit>(),
              child: HomePage(
                name: Get.arguments[0],
                selectedCity: Get.arguments[1],
                currentWeatherResponse: Get.arguments[2],
              ),
            )),
  ];
}
