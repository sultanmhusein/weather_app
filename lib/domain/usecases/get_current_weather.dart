import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/entities/current_weather_response.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/shared/failure.dart';

class GetCurrentWeather {
  final WeatherRepository _weatherRepository;

  GetCurrentWeather(this._weatherRepository);

  Future<Either<Failure, CurrentWeatherResponse?>> execute(String city) {
    return _weatherRepository.getCurrentWeather(city);
  }
}
