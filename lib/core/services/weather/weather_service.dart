import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:weather/core/constants/assets_global.dart';
import 'package:weather/core/models/weather_info_model.dart';
import 'package:weather/core/services/weather/weather_service_interface.dart';

class WeatherService implements IWeatherService {

  double windSpeedCondition = 2.5;

  @override
  String findIconToWeather(WeatherInfoModel weatherInfo, int date, num clouds, num windSpeed) {
    int hour = DateTime.fromMillisecondsSinceEpoch(date * 1000).hour;

    if (hour >= 6 && hour <= 17) {
      // Rain
      if (weatherInfo.id == 200 || weatherInfo.id == 201) {
        return windSpeed >= windSpeedCondition ? AppAssets.dayRainWindy : AppAssets.dayRain;
      }
      // Drizze-Rain
      if (weatherInfo.id >= 202 && weatherInfo.id <= 232) {
        return AppAssets.dayRainny;
      }
      // Rain
      if (weatherInfo.id >= 300 && weatherInfo.id <= 311) {
        return windSpeed >= windSpeedCondition ? AppAssets.dayRainWindy : AppAssets.dayRain;
      }
      // Rain
      if (weatherInfo.id >= 312 && weatherInfo.id <= 321) {
        return AppAssets.dayRainny;
      }
      // Rain
      if (weatherInfo.id == 500 || weatherInfo.id == 501) {
        return windSpeed >= windSpeedCondition ? AppAssets.dayRainWindy : AppAssets.dayRain;
      }
      // Rain
      if (weatherInfo.id >= 502 && weatherInfo.id <= 531) {
        return AppAssets.dayRainny;
      }
      // Snow
      if (weatherInfo.id == 501) {
        return AppAssets.dayRainnySnow;
      }
      // Snow Rain
      if (weatherInfo.id >= 600 && weatherInfo.id <= 622) {
        return AppAssets.dayRainnySnow;
      }
      // Sunny
      if (weatherInfo.id == 800) {
        return windSpeed >= windSpeedCondition ? AppAssets.daySunnyWindy : AppAssets.daySunny;
      }
      // Sun clear
      if (weatherInfo.id >= 801 && weatherInfo.id <= 804) {
        return windSpeed >= windSpeedCondition ? AppAssets.dayClearSkyWindy : AppAssets.dayClearSky;
      }

      return AppAssets.dayClearSky;
    } else {
      // Rain
      if (weatherInfo.id == 200 || weatherInfo.id == 201) {
          if (windSpeed > 1.5) {
            return windSpeed >= windSpeedCondition ? AppAssets.nightCloudWindyRain : AppAssets.nightCloudRain;
          } else {
            return windSpeed >= windSpeedCondition ? AppAssets.nightRainWindy : AppAssets.nightCloudRain;
          }
      }
      // Rain
      if (weatherInfo.id >= 202 && weatherInfo.id <= 232) {
        return AppAssets.nightRainny;
      }
      // Drizze-Rain
      if (weatherInfo.id >= 300 && weatherInfo.id <= 311) {
        if (clouds > 2) {
          return windSpeed >= windSpeedCondition ? AppAssets.nightCloudWindyRain : AppAssets.nightCloudRain;
        } else {
          return windSpeed >= windSpeedCondition ? AppAssets.nightRainWindy : AppAssets.nightRainny;
        }
      }
      // Drizze-Rain
      if (weatherInfo.id >= 312 && weatherInfo.id <= 321) {
        return AppAssets.nightCloudRain;

      }
      // Rain
      if (weatherInfo.id == 500 || weatherInfo.id == 501) {
        if (clouds > 2) {
          return windSpeed >= windSpeedCondition ? AppAssets.nightCloudWindyRain : AppAssets.nightCloudRain;
        } else {
          return windSpeed >= windSpeedCondition ? AppAssets.nightRainWindy : AppAssets.nightRainny;
        }
      }
      // Rain
      if (weatherInfo.id >= 502 && weatherInfo.id <= 531) {
        return AppAssets.nightRainny;
      }
      // Snow
      if (weatherInfo.id == 511) {
        return AppAssets.nightCloudSnow;
      }
      // Snow
      if (weatherInfo.id >= 600 && weatherInfo.id <= 622) {
        return AppAssets.nightSnow;
      }
      // Sun
      if (weatherInfo.id == 800) {
        return windSpeed >= windSpeedCondition ? AppAssets.nightWindy : AppAssets.nightClearSky;
      }
      // Sun
      if (weatherInfo.id >= 801 && weatherInfo.id <= 804) {
        return windSpeed >= windSpeedCondition ? AppAssets.nightCloudWindy : AppAssets.nightCloud;
      }
      
      return AppAssets.nightClearSky;
    }
  }

  @override
  String findUVIndexLabel(num uvIndex) {
    if (uvIndex <= 2) return 'Low';
    if (uvIndex <= 5) return 'Moderate';
    if (uvIndex <= 7) return 'Hight';
    if (uvIndex <= 10) return 'Vary Hight';
    if (uvIndex > 10) return 'Extreme';

    return 'Undetermined';
  }

  @override
  double calculateUVIndexTax(num uvIndex) {
    return ((uvIndex * 100) / 11) / 100;
  }

  @override
  double calculateSunPosition(int date) {
    int hour = DateTime.fromMillisecondsSinceEpoch(date * 1000).hour;

    double percentOfDay = hour * 100 / 24;

    return percentOfDay / 100;
  }

  @override
  String formatDateHour(int date) {
    return formatDate(date, 'H a');
  }

  @override
  String formatDateHourMinute(int date) {
    return formatDate(date, 'H:mm a');
  }

  @override
  String formatDateWeek(int date) {
    return formatDate(date, 'EEE');
  }

  @override
  num calculateHpaToCircle(num hpa) {
    double maxPressure = 751.9;
    double maxCirlcePi = 360;

    return maxPressure * maxCirlcePi / hpa;
  }

  @override
  String convertVisibilityToKm(num meters) {
    try {
      return (meters / 1000).round().toString() + ' KM';
    } on Exception catch (error) {
      log(error.toString());
      return '- KM';
    }
  }

  @override
  String findVisibilityStatus(num meters) {
    if (meters > 7000) return 'Visibility is good';
    if (meters > 4000) return 'Visibility is not so good';
    if (meters > 0) return 'Careful Visibility is not good';
    
    return '';
  }

  @override
  String feelsLikeTempStatus(num temperature, num currentTemp) {
    num average = temperature - currentTemp;

    if (average < 0) {
      average *= - 1;
    }

    if (average <= 1) return 'Similar to the actual temperature';

    if (temperature < currentTemp) return 'Colder than the actual temperature';
    if (temperature > currentTemp) return 'Hotter than the actual temperature';

    return '';
  }

  String formatDate(int date, String format) {
    try {
      return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(date * 1000));
    } on Exception {
      return 'Format not found';
    }
  }
}