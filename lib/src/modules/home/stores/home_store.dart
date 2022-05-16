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

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store implements IHomeStore {
  final HomeRepository homeRepository;
  final WeatherService weatherService;
  final GeoService geoService;

  _HomeStoreBase({
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
  LocationWeatherModel? weather;
  
  @override
  @observable
  CurrentWeatherModel? currentWeather;
  
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
  bool isOpen = false;

  @override
  @observable
  int selectedTab = 0;

  @override
  @action
  void toggleSheetVisibility() {
    if (draggableScrollableController.size > 0.01) {
      draggableScrollableController.reset();
      isOpen = false;
    } else {
      draggableScrollableController.jumpTo(.4);
      isOpen = true;
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
  ForecastItemModel buildForecastItem(int index) {
    if (selectedTab == 0) {
      return buildFromHourly(index);
    } else {
      return buildFromDaily(index);
    }
  }

  ForecastItemModel buildFromDaily (int index) {
    DailyModel daily = weather!.daily[index];
    TemperatureModel temperature = daily.temperature;

    num averageTemp = temperature.day.round()
      + temperature.eve.round()
      + temperature.morn.round()
      + temperature.night.round();

    averageTemp /= 4;

    return ForecastItemModel(
      title: weatherService.formatDateWeek(daily.date),
      humidity: daily.humidity.toString() + '%',
      temp: averageTemp.round().toString() + '˚',
      iconPath: weatherService.findIconToWeather(daily.weatherInfo.first, daily.date, daily.clouds, daily.windSpeed)
    );
  }

  ForecastItemModel buildFromHourly (int index) {
    HourlyModel hourly = weather!.hourly[index];

    return ForecastItemModel(
      title: weatherService.formatDateHour(hourly.date),
      humidity: hourly.humidity.toString() + '%',
      temp: hourly.temperature.round().toString(),
      iconPath: weatherService.findIconToWeather(hourly.weatherInfo.first, hourly.date, hourly.clouds, hourly.windSpeed)
    );
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
  Future<LocationWeatherModel> getAllForecasts() async {
    try {
      isLoading = true;
      Position position = await geoService.getCurrentPosition();
      weather = await homeRepository.getForecasts(position);
      currentWeather = weather!.current;

      List<Placemark> location = await placemarkFromCoordinates(position.latitude, position.longitude);
      cityName = location.first.locality ?? '';
      isLoading = false;
      return weather!;
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('Error getting forecast data');
    }
  }
  
}