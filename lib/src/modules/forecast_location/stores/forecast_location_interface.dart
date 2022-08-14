import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/src/modules/forecast_location/models/city_model.dart';

abstract class IForecastLocation {

  TextEditingController get searchController;

  set citiesList(ObservableList<CityModel> citiesList);
  ObservableList<CityModel> get citiesList;

  set loading(bool loading);
  bool get loading;
  
  void searchOnChange();

  String getWeatherIcon();
}