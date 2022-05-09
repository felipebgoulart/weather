import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/drivers/env.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/services/dio/dio_client.dart';
import 'package:weather/core/services/dio/dio_interface.dart';
import 'package:weather/core/services/geo/geo_interface.dart';
import 'package:weather/core/services/geo/geo_service.dart';

List<Bind<Object>> coreRegisterDependencies() {
  return <Bind<Object>> [
    Bind.singleton<IDio>(
      (dynamic i) => DioClient()
    ),
    Bind.singleton<IEnvironment>(
      (dynamic i) => Environment()
    ),
    Bind.singleton<IGeo>(
      (dynamic i) => GeoService()
    ),
  ];
}
