import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/current_weather_response.dart';
import 'package:weather_app/domain/entities/forecast_weather_response.dart';
import 'package:weather_app/domain/usecases/get_current_weather.dart';
import 'package:weather_app/domain/usecases/get_forecast_weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._getCurrentWeather, this._getForecastWeather)
      : super(WeatherInitial());

  final GetCurrentWeather _getCurrentWeather;
  final GetForecastWeather _getForecastWeather;

  void getCurrentWeather(String city) async {
    emit(WeatherLoading());

    var result = await _getCurrentWeather.execute(city);
    result.fold((failed) => emit(WeatherFailed(failed.message)),
        (data) => emit(WeatherLoaded(data)));
  }

  void getForecastWeather(String city) async {
    emit(ForecastWeatherLoading());

    var result = await _getForecastWeather.execute(city);
    result.fold((failed) => emit(WeatherFailed(failed.message)),
        (data) => emit(ForecastWeatherLoaded(data)));
  }
}
