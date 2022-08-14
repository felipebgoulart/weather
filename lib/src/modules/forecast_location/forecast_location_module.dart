import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/services/dio/dio_interface.dart';
import 'package:weather/core/services/geo/geo_service.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';
import 'package:weather/src/modules/forecast_location/pages/forecast_location_page.dart';
import 'package:weather/src/modules/forecast_location/repositories/forecast_location_repository.dart';
import 'package:weather/src/modules/forecast_location/stores/forecast_location_store.dart';
import 'package:weather/src/modules/home/repositories/home_repository.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';

class ForecastLocationModule extends Module {

  @override
  List<Bind<Object>> get binds => <Bind<Object>> [
    Bind.lazySingleton<WeatherService>(
      (dynamic i) => WeatherService()
    ),
    Bind.lazySingleton<ForecastLocationRepository>(
      (dynamic i) => ForecastLocationRepository(httpDio: i.get<IDio>(), env: i.get<IEnvironment>())
    ),
    Bind.lazySingleton(
      (dynamic i) => HomeRepository(httpDio: i.get<IDio>(), env: i.get<IEnvironment>())
    ),
    Bind.lazySingleton<HomeStore>(
      (dynamic i) => HomeStore(weatherService: i.get<WeatherService>(), homeRepository: i.get<HomeRepository>(), geoService: i.get<GeoService>())
    ),
    Bind.lazySingleton<ForecastLocationStore>(
      (dynamic i) => ForecastLocationStore(weatherService: i.get<WeatherService>(), repository: i.get<ForecastLocationRepository>())
    ),
  ];

  @override
  List<ModularRoute> get routes => <ModularRoute> [
    ChildRoute<dynamic>(
      '/',
      child: (BuildContext context, ModularArguments args) => const ForecastLocationPage(),
    )
  ];
}