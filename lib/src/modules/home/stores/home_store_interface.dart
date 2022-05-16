import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/core/models/current_weather_model.dart';
import 'package:weather/core/models/location_weather_model.dart';
import 'package:weather/src/modules/home/models/forecast_item_model.dart';

abstract class IHomeStore with Store {

  set backgroundImage(String imagePath);
  String get backgroundImage;
  
  set backgroundFigure(String imagePath);
  String get backgroundFigure;

  set weather(LocationWeatherModel? value);
  LocationWeatherModel? get weather;

  set cityName(String? value);
  String? get cityName;

  set currentWeather(CurrentWeatherModel? value);
  CurrentWeatherModel? get currentWeather;
  
  set isLoading(bool value);
  bool get isLoading;

  set draggableScrollableController(DraggableScrollableController value);
  DraggableScrollableController get draggableScrollableController;
  
  set forecastHorizontalScrollController(ScrollController value);
  ScrollController get forecastHorizontalScrollController;

  set isOpen(bool value);
  bool get isOpen;

  set selectedTab(int value);
  int get selectedTab;

  void toggleSheetVisibility();

  void closeAnimate();

  void changeTab(int tab);

  void changeBackgroundimage();

  ForecastItemModel buildForecastItem(int index);

  int forecastListLenght();

  Future<void> getAllForecasts();
}