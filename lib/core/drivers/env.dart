import 'package:weather/core/drivers/env_interface.dart';

class Environment implements IEnvironment {

  Environment();

  @override
  String get appId => '{{your appid}}';
  
  @override
  String get baseUrl => 'https://api.openweathermap.org/data/2.5';
}