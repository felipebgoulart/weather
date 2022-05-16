import 'package:weather/core/models/rain_model.dart';
import 'package:weather/core/models/weather_info_model.dart';

abstract class WeatherModel {

  int date;
  int pressure;
  int humidity;
  num dewPoint;
  num uvi;
  int clouds;
  num windSpeed;
  num windDeg;
  num? windGust;
  List<WeatherInfoModel> weatherInfo;

  WeatherModel({
    required this.date,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weatherInfo,
  });
}