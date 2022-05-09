import 'package:weather/core/models/weather_info_model.dart';
import 'package:weather/core/models/weather_model.dart';

class HourlyModel extends WeatherModel {

  num feelsLike;
  int visibility;
  num temperature;

  HourlyModel({
    required int date,
    required this.temperature,
    required this.feelsLike,
    required int pressure,
    required int humidity,
    required num dewPoint,
    required num uvi,
    required int clouds,
    required this.visibility,
    required num windSpeed,
    required int windDeg,
    required num windGust,
    required List<WeatherInfoModel> weatherInfo
  }) : super(
    date: date,
    pressure: pressure,
    humidity: humidity,
    dewPoint: dewPoint,
    uvi: uvi,
    clouds: clouds,
    windSpeed: windSpeed,
    windDeg: windDeg,
    windGust: windGust,
    weatherInfo: weatherInfo
  );

  factory HourlyModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return HourlyModel(
      date: json['dt'],
      temperature: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weatherInfo: (json['weather'] as List<dynamic>?)?.map((dynamic x) => WeatherInfoModel.fromJson(x)).toList() ?? List<WeatherInfoModel>.empty()
    );
  }
}