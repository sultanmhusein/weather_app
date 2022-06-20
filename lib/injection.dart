import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_current_weather.dart';
import 'package:weather_app/domain/usecases/get_forecast_weather.dart';
import 'package:weather_app/presentations/cubit/weather_cubit.dart';
import 'package:weather_app/shared/network.dart';

final locator = GetIt.instance;

void init({bool isTesting = false}) {
  if (!isTesting) {
    // Network
    locator.registerLazySingleton(() => Network(Dio()));

    // Remote Data
    locator.registerLazySingleton<WeatherRemoteDatasource>(
        () => WeatherRemoteDatasourceImpl(locator()));

    // Cubit
    locator.registerFactory(() => WeatherCubit(locator(), locator()));

    // Usecase
    locator.registerLazySingleton(() => GetCurrentWeather(locator()));
    locator.registerLazySingleton(() => GetForecastWeather(locator()));

    // Repository
    locator.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(locator()));
  }
}
