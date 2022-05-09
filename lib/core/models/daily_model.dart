import 'package:weather/core/models/feels_like_model.dart';
import 'package:weather/core/models/temperature_model.dart';
import 'package:weather/core/models/weather_info_model.dart';
import 'package:weather/core/models/weather_model.dart';

class DailyModel extends WeatherModel {

  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  FeelsLikeModel feelsLike;
  TemperatureModel temperature;

  DailyModel({
    required int date,
    required this.temperature,
    required this.feelsLike,
    required int pressure,
    required int humidity,
    required num dewPoint,
    required num uvi,
    required int clouds,
    required num windSpeed,
    required int windDeg,
    required double windGust,
    required List<WeatherInfoModel> weatherInfo,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase
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

  factory DailyModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return DailyModel(
      date: json['dt'],
      temperature: TemperatureModel.fromJson(json['temp']),
      feelsLike: FeelsLikeModel.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weatherInfo: (json['weather'] as List<dynamic>?)?.map((dynamic x) => WeatherInfoModel.fromJson(x)).toList() ?? List<WeatherInfoModel>.empty(),
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase']
    );
  }
}