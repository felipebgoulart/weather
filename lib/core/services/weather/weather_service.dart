import 'package:weather/core/constants/assets_global.dart';
import 'package:weather/core/models/hourly_model.dart';

class WeatherService {

  static String findIconToWeatherFromDaily(HourlyModel hourly) {

    int hour = DateTime.fromMillisecondsSinceEpoch(hourly.date * 1000).hour;

    if (hour > 18) {
      return AppAssets.nightClearSky;
    } else {
      return AppAssets.dayClearSky;
    }
  }
}