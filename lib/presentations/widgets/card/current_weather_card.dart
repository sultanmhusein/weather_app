import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentations/theme/app_asset.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';
import 'package:weather_app/presentations/widgets/content/custom_content.dart';
import 'package:weather_app/shared/routers.dart';
import 'package:weather_app/shared/utils/date_utils.dart';

class CurrentWeatherCard extends StatelessWidget {
  final DateTime dateTime;
  final String name,
      city,
      weather,
      icWeather,
      pressure,
      humidity,
      wind,
      temperature;

  CurrentWeatherCard({
    Key? key,
    required this.dateTime,
    required this.name,
    required this.city,
    required this.weather,
    required this.icWeather,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      Text(DateUtilities.getGreeting(DateTime.now().hour),
                          style: AppText.kBody
                              .copyWith(color: AppColor.kWhiteColor)),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routers.form);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Image(
                            image: AppAsset.refresh,
                            width: 14,
                            height: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: AppText.kBody,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.MMMMEEEEd().format(dateTime),
                    style: AppText.kBody.copyWith(fontSize: 10),
                  ),
                  Image(
                    width: 48,
                    height: 48,
                    image: NetworkImage(
                      "http://openweathermap.org/img/w/" + icWeather + ".png",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(city + ", ", style: AppText.kBody),
                      Text(weather, style: AppText.kBody),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContent(
                      icon: AppAsset.pressure, text: pressure + " hps"),
                  CustomContent(icon: AppAsset.humidity, text: humidity + " %"),
                  CustomContent(icon: AppAsset.wind, text: wind + " m/s"),
                  CustomContent(
                      icon: AppAsset.temperature, text: temperature + "° C"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
