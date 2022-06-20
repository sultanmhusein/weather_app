import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/forecast_weather_response_model.dart';

class ForecastWeatherResponse extends Equatable {
  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;
  City? city;

  ForecastWeatherResponse(
      {this.cod, this.message, this.cnt, this.list, this.city});

  ForecastWeatherResponseModel get toModel => ForecastWeatherResponseModel(
      cod: cod, message: message, cnt: cnt, list: list, city: city);

  @override
  List<Object?> get props {
    return [cod, message, cnt, list, city];
  }
}
