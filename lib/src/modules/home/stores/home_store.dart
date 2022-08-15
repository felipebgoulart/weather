import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/core/constants/assets_global.dart';
import 'package:weather/core/models/current_weather_model.dart';
import 'package:weather/core/models/daily_model.dart';
import 'package:weather/core/models/hourly_model.dart';
import 'package:weather/core/models/location_weather_model.dart';
import 'package:weather/core/models/temperature_model.dart';
import 'package:weather/core/services/geo/geo_service.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/src/modules/home/models/forecast_item_model.dart';
import 'package:weather/src/modules/home/stores/home_store_interface.dart';
import 'package:weather/src/modules/home/repositories/home_repository.dart';

import '../models/forecast_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store implements IHomeStore {
  final HomeRepository homeRepository;
  final WeatherService weatherService;
  final GeoService geoService;

  HomeStoreBase({
    required this.homeRepository,
    required this.geoService,
    required this.weatherService
  });

  @override
  @observable
  String backgroundImage = AppAssets.nightSky;
  
  @override
  @observable
  String backgroundFigure = AppAssets.rocket;
  
  @override
  @observable
  bool isLoading = false;
  
  @override
  @observable
  int? selected;
  
  @override
  @observable
  LocationWeatherModel? weather;
  
  @override
  @observable
  CurrentWeatherModel? currentWeather;
  
  @override
  @observable
  List<ForecastModel> dailyList = ObservableList<ForecastModel>.of(<ForecastModel> []);
  
  @override
  @observable
  List<ForecastModel> hourlyList = ObservableList<ForecastModel>.of(<ForecastModel> []);
  
  @override
  @observable
  ObservableList<ForecastItemModel> forecastList = ObservableList<ForecastItemModel>.of(<ForecastItemModel> []);
  
  @override
  @observable
  String? cityName;
  
  @override
  @observable
  DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  
  @override
  @observable
  ScrollController forecastHorizontalScrollController = ScrollController();
  
  @override
  @observable
  ScrollController scrollController = ScrollController();

  @override
  @observable
  bool isOpen = false;

  @override
  @observable
  int selectedTab = 0;

  @override
  @observable
  ForecastModel? forecast;

  @override
  @action
  void toggleSheetVisibility() {
    scrollController.jumpTo(0);
    if (draggableScrollableController.size > 0.39) {
      draggableScrollableController.reset();
      isOpen = false;
    } else {
      draggableScrollableController.jumpTo(0.42);
      isOpen = true;
    }
  }

  @override
  @action
  void buildForecast(int index, { bool current = false }) {

    if (current) {
      forecast = ForecastModel(
        temperature: currentWeather!.temperature,
        description: currentWeather!.weatherInfo.first.description,
        uvi: currentWeather!.uvi,
        windSpeed: currentWeather!.windSpeed,
        windDeg: currentWeather!.windDeg,
        feelsLike: currentWeather!.feelsLike,
        humidity: currentWeather!.humidity,
        dewPoint: currentWeather!.dewPoint,
        pressure: currentWeather!.pressure,
        date: currentWeather!.date,
        visibility: currentWeather!.visibility,
        sunset: currentWeather!.sunset,
        rain: currentWeather!.rain,
        clouds: currentWeather!.clouds,
        weatherInfo: currentWeather!.weatherInfo
      );
    } else {
      if (selectedTab == 0) {
        forecast = ForecastModel(
          temperature: weather!.hourly[index].temperature,
          description: weather!.hourly[index].weatherInfo.first.description,
          uvi: weather!.hourly[index].uvi,
          windSpeed: weather!.hourly[index].windSpeed,
          windDeg: weather!.hourly[index].windDeg,
          feelsLike: weather!.hourly[index].feelsLike,
          humidity: weather!.hourly[index].humidity,
          dewPoint: weather!.hourly[index].dewPoint,
          pressure: weather!.hourly[index].pressure,
          date: weather!.hourly[index].date,
          visibility: weather!.hourly[index].visibility,
          rain: weather!.hourly[index].rain,
          clouds: weather!.hourly[index].clouds,
          weatherInfo: weather!.hourly[index].weatherInfo
        );
      } else {
        forecast = ForecastModel(
          temperature: weather!.daily[index].temperature.day,
          description: weather!.daily[index].weatherInfo.first.description,
          uvi: weather!.daily[index].uvi,
          windSpeed: weather!.daily[index].windSpeed,
          windDeg: weather!.daily[index].windDeg,
          feelsLike: weather!.daily[index].feelsLike.day,
          humidity: weather!.daily[index].humidity,
          dewPoint: weather!.daily[index].dewPoint,
          pressure: weather!.daily[index].pressure,
          date: weather!.daily[index].date,
          sunset: weather!.daily[index].sunset,
          rain: weather!.daily[index].rain,
          clouds: weather!.daily[index].clouds,
          weatherInfo: weather!.daily[index].weatherInfo
        );
      }
    }
  }

  @override
  @action
  void closeAnimate() {
    draggableScrollableController.animateTo(
      0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceIn
    );
    isOpen = false;
  }

  @override
  @action
  void changeTab(int tab) {
    selectedTab = tab;
    forecastHorizontalScrollController.jumpTo(0);
  }

  @override
  void buildForecastItem() {
    if (selectedTab == 0) {
      forecastList = buildFromHourly();
    } else {
      forecastList = buildFromDaily();
    }
  }

  ObservableList<ForecastItemModel> buildFromDaily () {
    ObservableList<ForecastItemModel> list = ObservableList<ForecastItemModel>.of(<ForecastItemModel> []);

    for (int index = 0; index < weather!.daily.length; index++) {
      DailyModel daily = weather!.daily[index];
      TemperatureModel temperature = daily.temperature;

      num averageTemp = temperature.day.round()
        + temperature.eve.round()
        + temperature.morn.round()
        + temperature.night.round();

      averageTemp /= 4;

      list.add(
        ForecastItemModel(
          title: weatherService.formatDateWeek(daily.date),
          humidity: daily.humidity.toString() + '%',
          temp: averageTemp.round().toString() + '˚',
          iconPath: weatherService.findIconToWeather(daily.weatherInfo.first, daily.date, daily.clouds, daily.windSpeed),
          selected: daily.selected
        )
      );
    }

    return list;
  }

  ObservableList<ForecastItemModel> buildFromHourly () {
    ObservableList<ForecastItemModel> list = ObservableList<ForecastItemModel>.of(<ForecastItemModel> []);

    for (int index = 0; index < weather!.hourly.length; index++) {
      HourlyModel hourly = weather!.hourly[index];

      list.add(
        ForecastItemModel(
          title: weatherService.formatDateHour(hourly.date),
          humidity: hourly.humidity.toString() + '%',
          temp: hourly.temperature.round().toString(),
          iconPath: weatherService.findIconToWeather(hourly.weatherInfo.first, hourly.date, hourly.clouds, hourly.windSpeed),
          selected: hourly.selected
        )
      );
    }

    return list;
  }

  @override
  int forecastListLenght() {
    return selectedTab == 0 ? weather!.hourly.length : weather!.daily.length;
  }

  @override
  @action
  void changeBackgroundimage() {
    int hour = DateTime.now().hour;

    if (hour >= 12 && hour <= 17) {
      backgroundImage = AppAssets.noonSky;
      backgroundFigure = AppAssets.rocketSally;
    }
    if (hour >= 6 && hour < 12) {
      backgroundImage = AppAssets.morningSky;
      backgroundFigure = AppAssets.restSally;
    }
  }

  @override
  Future<LocationWeatherModel> getAllForecasts({ Position? position }) async {
    try {
      isLoading = true;
      position ??= await geoService.getCurrentPosition();
      weather = await homeRepository.getForecasts(position);
      currentWeather = weather!.current;

      List<Placemark> location = await placemarkFromCoordinates(position.latitude, position.longitude);

      cityName = location.first.locality ?? '';
      
      if (cityName!.isEmpty) {
        cityName = location.first.subAdministrativeArea;
      }
      if (cityName!.isEmpty) {
        cityName = location.first.administrativeArea;
      }
      await _populateForecasts();
      isLoading = false;
      return weather!;
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('Error getting forecast data');
    }
  }

  Future<void> _populateForecasts() async {
    for (int index = 0; index < weather!.daily.length; index++) {
       dailyList.add(
        ForecastModel(
          temperature: weather!.daily[index].temperature.day,
          description: weather!.daily[index].weatherInfo.first.description,
          uvi: weather!.daily[index].uvi,
          windSpeed: weather!.daily[index].windSpeed,
          windDeg: weather!.daily[index].windDeg,
          feelsLike: weather!.daily[index].feelsLike.day,
          humidity: weather!.daily[index].humidity,
          dewPoint: weather!.daily[index].dewPoint,
          pressure: weather!.daily[index].pressure,
          date: weather!.daily[index].date,
          sunset: weather!.daily[index].sunset,
          rain: weather!.daily[index].rain,
          weatherInfo: weather!.daily[index].weatherInfo,
          clouds: weather!.daily[index].clouds
        )
      );
    }

    for (int index = 0; index < weather!.hourly.length; index++) {
      hourlyList.add(
        ForecastModel(
          temperature: weather!.hourly[index].temperature,
          description: weather!.hourly[index].weatherInfo.first.description,
          uvi: weather!.hourly[index].uvi,
          windSpeed: weather!.hourly[index].windSpeed,
          windDeg: weather!.hourly[index].windDeg,
          feelsLike: weather!.hourly[index].feelsLike,
          humidity: weather!.hourly[index].humidity,
          dewPoint: weather!.hourly[index].dewPoint,
          pressure: weather!.hourly[index].pressure,
          date: weather!.hourly[index].date,
          visibility: weather!.hourly[index].visibility,
          rain: weather!.hourly[index].rain,
          weatherInfo: weather!.hourly[index].weatherInfo,
          clouds: weather!.hourly[index].clouds
        )
      );
    }
  }

  @override
  void findSelected(int index) {
    clearAll();
    if (selectedTab == 0) {
      weather!.hourly[index].selected = true;
    } else {
      weather!.daily[index].selected = true;
    }
  }

  @override
  void clearAll() {
    _clearDaily();
    _clearHourly();
  }

  void _clearDaily() {
    for (DailyModel element in weather!.daily) {
      element.selected = false;
    }
  }

  void _clearHourly() {
    for (HourlyModel element in weather!.hourly) {
      element.selected = false;
    }
  }
  
}