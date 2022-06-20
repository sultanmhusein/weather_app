import 'package:weather_app/config/api_config.dart';
import 'package:weather_app/data/models/current_weather_response_model.dart';
import 'package:weather_app/data/models/forecast_weather_response_model.dart';
import 'package:weather_app/shared/network.dart';
import 'package:weather_app/shared/response_server.dart';

abstract class WeatherRemoteDatasource {
  Future<CurrentWeatherResponseModel?> getCurrentWeather(String city);
  Future<ForecastWeatherResponseModel?> getForecastWeather(String city);
}

class WeatherRemoteDatasourceImpl extends WeatherRemoteDatasource {
  final Network _network;

  WeatherRemoteDatasourceImpl(this._network);

  String apiKey = ApiConfig.apiKey;

  @override
  Future<CurrentWeatherResponseModel?> getCurrentWeather(String city) async {
    var response = await _network.request("GET",
        ApiConfig.currentWeather + "?q=$city, ID&units=metric&appid=$apiKey",
        contentType: "application/json", content: "") as ResponseServer;

    return CurrentWeatherResponseModel.fromMap(response.data);
  }

  @override
  Future<ForecastWeatherResponseModel?> getForecastWeather(String city) async {
    var response = await _network.request("GET",
        ApiConfig.forecastWeather + "?q=$city, ID&units=metric&appid=$apiKey",
        contentType: "application/json", content: "") as ResponseServer;

    return ForecastWeatherResponseModel.fromMap(response.data);
  }
}
