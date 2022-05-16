import 'package:weather/core/models/weather_info_model.dart';

abstract class IWeatherService {

  String findIconToWeather(WeatherInfoModel weatherInfo, int date, num clouds, num windSpeed);

  String findUVIndexLabel(num uvIndex);

  double calculateUVIndexTax(num uvIndex);

  double calculateSunPosition(int date);

  String formatDateHour(int date);
 
  String formatDateHourMinute(int date);

  String formatDateWeek(int date);
}