import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/core/models/weather_info_model.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/src/modules/forecast_location/models/city_model.dart';
import 'package:weather/src/modules/forecast_location/repositories/forecast_location_repository.dart';
import 'package:weather/src/modules/forecast_location/stores/forecast_location_interface.dart';

part 'forecast_location_store.g.dart';

class ForecastLocationStore = ForecastLocationStoreBase with _$ForecastLocationStore;

abstract class ForecastLocationStoreBase with Store implements IForecastLocation {
  final WeatherService weatherService;
  final ForecastLocationRepository repository;

  ForecastLocationStoreBase({
    required this.weatherService,
    required this.repository
  });

  Timer? _debounce;

  @observable
  @override
  ObservableList<CityModel> citiesList = ObservableList<CityModel>.of(<CityModel> []);
  
  @observable
  @override
  bool loading = false;

  @observable
  @override
  TextEditingController searchController = TextEditingController();

  @override
  Future<void> searchOnChange() async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      List<CityModel> list = await repository.findCities(searchController.text);
      
      citiesList.clear();
      citiesList.addAll(list.where((CityModel element) => element.state.isNotEmpty));
    });
  }

  @override
  String getWeatherIcon() {
    String a = weatherService.findIconToWeather(WeatherInfoModel(id: 0, main: '', description: '', icon: ''), 1655900414, 0.4, 0.2);

    return a;
  }

}