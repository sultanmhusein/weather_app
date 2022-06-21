import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentations/theme/app_asset.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';
import 'package:weather_app/presentations/widgets/content/custom_content.dart';
import 'package:weather_app/shared/routers.dart';
import 'package:weather_app/shared/utils/date_utils.dart';

class ForecastWeatherCard extends StatelessWidget {
  final DateTime dateTime;
  final String icWeather, temperature;

  ForecastWeatherCard({
    Key? key,
    required this.dateTime,
    required this.icWeather,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Text(
            DateFormat('EEEE').format(dateTime),
            style: AppText.kLabel.copyWith(fontSize: 10),
          ),
          Text(
            DateFormat.Hm().format(dateTime),
            style: AppText.kLabelSmall,
          ),
          Image(
            width: 24,
            height: 24,
            image: NetworkImage(
                "http://openweathermap.org/img/w/" + icWeather + ".png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temperature,
                style: AppText.kLabelSmall,
              ),
              Text(
                "° C",
                style: AppText.kLabelSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
