import 'package:weather/core/drivers/env_interface.dart';

class Environment implements IEnvironment {

  Environment();

  @override
  String get appId => 'db63e8ab297d07e25bad74fe085cb575';
  
  @override
  String get baseUrl => 'https://api.openweathermap.org/data/2.5';
  
  @override
  String get baseUrlMap => 'http://api.openweathermap.org/geo/1.0';
}