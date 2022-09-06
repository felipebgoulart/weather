import 'package:weather/core/models/rain_model.dart';
import 'package:weather/core/models/weather_info_model.dart';
import 'package:weather/core/models/weather_model.dart';

class CurrentWeatherModel extends WeatherModel {

  int sunrise;
  int sunset;
  num feelsLike;
  int visibility;
  num temperature;
  RainModel? rain;

  CurrentWeatherModel({
    required int date,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required int pressure,
    required int humidity,
    required num dewPoint,
    required num uvi,
    required int clouds,
    required num windSpeed,
    required num windDeg,
    required num? windGust,
    required List<WeatherInfoModel> weatherInfo,
    required this.visibility,
    this.rain,
  }) : super(
    date: date,
    clouds: clouds,
    dewPoint: dewPoint,
    humidity: humidity,
    pressure: pressure,
    uvi: uvi,
    windDeg: windDeg,
    windGust: windGust,
    windSpeed: windSpeed,
    weatherInfo: weatherInfo,
  );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return CurrentWeatherModel(
      date: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temperature: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weatherInfo: (json['weather'] as List<dynamic>?)?.map((dynamic x) => WeatherInfoModel.fromJson(x)).toList() ?? List<WeatherInfoModel>.empty(),
      visibility: json['visibility'],
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null
    );
  }
}