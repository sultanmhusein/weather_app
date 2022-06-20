import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/entities/current_weather_response.dart';
import 'package:weather_app/domain/entities/forecast_weather_response.dart';
import 'package:weather_app/shared/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeather(
      String city);
  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeather(
      String city);
}
