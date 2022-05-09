import 'package:weather/core/models/current_weather_model.dart';
import 'package:weather/core/models/daily_model.dart';
import 'package:weather/core/models/hourly_model.dart';

class LocationWeatherModel {

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  CurrentWeatherModel current;
  List<HourlyModel> hourly;
  List<DailyModel> daily;

  LocationWeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory LocationWeatherModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data is null');
    }

    return LocationWeatherModel(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: CurrentWeatherModel.fromJson(json['current']),
      hourly: (json['hourly'] as List<dynamic>?)?.map((dynamic x) => HourlyModel.fromJson(x)).toList() ?? List<HourlyModel>.empty(),
      daily: (json['daily'] as List<dynamic>?)?.map((dynamic x) => DailyModel.fromJson(x)).toList() ?? List<DailyModel>.empty(),
    );
  }
}