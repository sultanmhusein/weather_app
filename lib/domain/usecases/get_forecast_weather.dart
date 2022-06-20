import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/entities/forecast_weather_response.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/shared/failure.dart';

class GetForecastWeather {
  final WeatherRepository _weatherRepository;

  GetForecastWeather(this._weatherRepository);

  Future<Either<Failure, ForecastWeatherResponse?>> execute(String city) {
    return _weatherRepository.getForecastWeather(city);
  }
}
