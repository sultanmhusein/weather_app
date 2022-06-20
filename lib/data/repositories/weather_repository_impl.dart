import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/domain/entities/current_weather_response.dart';
import 'package:weather_app/domain/entities/forecast_weather_response.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/shared/failure.dart';
import 'package:weather_app/shared/network_exception.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDatasource _remoteDatasource;

  WeatherRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeather(
      String city) async {
    try {
      var result = await _remoteDatasource.getCurrentWeather(city);

      return Right(result!.toEntity());
    } on NetworkException catch (e) {
      return Left(ConnectionFailure(
          responseCode: e.responseCode,
          httpStatus: e.httpStatus,
          message: "City not found,\nPlease try with another City."));
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeather(
      String city) async {
    try {
      var result = await _remoteDatasource.getForecastWeather(city);

      return Right(result!.toEntity());
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }
}
