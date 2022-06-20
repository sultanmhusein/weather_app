part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final CurrentWeatherResponse? currentWeather;

  WeatherLoaded(this.currentWeather);
}

class ForecastWeatherLoaded extends WeatherState {
  final ForecastWeatherResponse? forecastWeather;

  ForecastWeatherLoaded(this.forecastWeather);
}

class ForecastWeatherLoading extends WeatherState {}

class WeatherFailed extends WeatherState {
  final String message;

  WeatherFailed(this.message);
}
