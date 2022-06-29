import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/models/hourly_model.dart';
import 'package:weather/core/services/dio/dio_interface.dart';
import 'package:weather/core/services/geo/geo_interface.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/services/weather/weather_service_interface.dart';
import 'package:weather/src/modules/home/pages/forecasts_page.dart';
import 'package:weather/src/modules/home/pages/home_page.dart';
import 'package:weather/src/modules/home/repositories/home_repository.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>> [
    Bind.lazySingleton<WeatherService>(
      (dynamic i) => WeatherService()
    ),
    Bind.lazySingleton<HomeRepository>(
      (dynamic i) => HomeRepository(httpDio: i.get<IDio>(), env: i.get<IEnvironment>())
    ),
    Bind.lazySingleton(
      (dynamic i) => HomeStore(homeRepository: i.get<HomeRepository>(), geoService: i.get<IGeo>(), weatherService: i.get<IWeatherService>())
    )
  ];

  @override
  List<ModularRoute> get routes => <ModularRoute> [
    ChildRoute<dynamic>(
      '/',
      child: (BuildContext context, dynamic args) => const HomePage(),
    ),
    ChildRoute<dynamic>(
      '/forecasts',
      child: (BuildContext context, ModularArguments arguments) => const ForecastsPage(),
    )
  ];
}