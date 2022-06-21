import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/entities/current_weather_response.dart';
import 'package:weather_app/domain/entities/forecast_weather_response.dart';
import 'package:weather_app/presentations/cubit/weather_cubit.dart';
import 'package:weather_app/presentations/widgets/background/background_sky.dart';
import 'package:weather_app/presentations/widgets/card/current_weather_card.dart';
import 'package:weather_app/presentations/widgets/card/forecast_weather_card.dart';

class HomePage extends StatefulWidget {
  final String? name;
  final String? selectedCity;
  final CurrentWeatherResponse? currentWeatherResponse;

  HomePage(
      {Key? key, this.name, this.selectedCity, this.currentWeatherResponse})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherCubit _weatherCubit;
  late ForecastWeatherResponse forecastWeatherResponse;

  void initState() {
    super.initState();
    _weatherCubit = context.read<WeatherCubit>();
    _weatherCubit.getForecastWeather(Get.arguments[2]?.name);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      BackgroundSky(),
      SafeArea(
        child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ForecastWeatherLoaded) {
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: screenSize.width * 0.9,
                            margin: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.05),
                            height: 225,
                            child: CurrentWeatherCard(
                                dateTime: DateTime.now(),
                                name: Get.arguments[0],
                                city: Get.arguments[1],
                                weather: Get.arguments[2].weather?[0].main,
                                icWeather: Get.arguments[2]?.weather?[0].icon,
                                pressure:
                                    Get.arguments[2].main.pressure.toString(),
                                humidity:
                                    Get.arguments[2].main.humidity.toString(),
                                wind: Get.arguments[2].wind.speed.toString(),
                                temperature:
                                    Get.arguments[2].main.temp.toString())),
                        Container(
                          width: screenSize.width * 0.9,
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: 16),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4),
                                  itemCount: state.forecastWeather?.cnt,
                                  itemBuilder: (context, index) {
                                    return ForecastWeatherCard(
                                        dateTime: state.forecastWeather
                                                ?.list?[index].dtTxt ??
                                            DateTime.now(),
                                        icWeather: state.forecastWeather!
                                            .list![index].weather![0].icon
                                            .toString(),
                                        temperature: state.forecastWeather
                                                ?.list?[index].main?.temp
                                                .toString() ??
                                            "--");
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SizedBox();
            }),
      ),
    ]));
  }
}
