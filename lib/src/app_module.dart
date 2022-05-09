import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/injectors.dart';
import 'package:weather/src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>> [
    ...coreRegisterDependencies(),
  ];

  @override
  List<ModularRoute> get routes => <ModuleRoute<dynamic>> [
    ModuleRoute<dynamic>(
      '/',
      module: HomeModule()
    )
  ];
}