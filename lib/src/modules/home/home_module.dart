import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/services/dio/dio_interface.dart';
import 'package:weather/core/services/geo/geo_interface.dart';
import 'package:weather/src/modules/home/home_page.dart';
import 'package:weather/src/modules/home/repositories/home_repository.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>> [
    Bind.lazySingleton<HomeRepository>(
      (dynamic i) => HomeRepository(httpDio: i.get<IDio>(), env: i.get<IEnvironment>())
    ),
    Bind.lazySingleton(
      (dynamic i) => HomeStore(homeRepository: i.get<HomeRepository>(), geoService: i.get<IGeo>())
    )
  ];

  @override
  List<ModularRoute> get routes => <ModularRoute> [
    ChildRoute<dynamic>(
      '/',
      child: (BuildContext context, dynamic args) => const HomePage(),
    )
  ];
}