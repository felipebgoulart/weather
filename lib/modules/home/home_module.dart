import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/modules/home/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>> [];

  @override
  List<ModularRoute> get routes => <ModularRoute> [
    ChildRoute<dynamic>(
      '/',
      child: (BuildContext context, dynamic args) => const HomePage(),
    )
  ];
}