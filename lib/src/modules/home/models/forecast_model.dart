import 'package:weather/core/models/weather_info_model.dart';

class ForecastModel {

  num temperature;
  String description;
  num uvi;
  int? sunset;
  num windSpeed;
  num windDeg;
  dynamic rain;
  num feelsLike;
  int humidity;
  num dewPoint;
  int? visibility;
  int pressure;
  int date;
  List<WeatherInfoModel> weatherInfo;
  num clouds;

  ForecastModel({
    required this.temperature,
    required this.description,
    required this.uvi,
    required this.windSpeed,
    required this.windDeg,
    required this.feelsLike,
    required this.humidity,
    required this.dewPoint,
    required this.pressure,
    required this.date,
    this.visibility,
    this.rain,
    this.sunset,
    required this.weatherInfo,
    required this.clouds
  });
}