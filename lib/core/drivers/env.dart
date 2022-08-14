import 'package:weather/core/drivers/env_interface.dart';

class Environment implements IEnvironment {

  Environment();

  @override
  String get appId => ''; // YOUR TOKEN HERE
  
  @override
  String get baseUrl => 'https://api.openweathermap.org/data/2.5';
  
  @override
  String get baseUrlMap => 'http://api.openweathermap.org/geo/1.0';
}