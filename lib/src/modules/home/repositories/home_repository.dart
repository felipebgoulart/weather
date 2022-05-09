import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/models/location_weather_model.dart';
import 'package:weather/core/services/dio/dio_interface.dart';

class HomeRepository {
  final IDio httpDio;
  final IEnvironment env;
  late final String _baseUrl;

  HomeRepository({
    required this.httpDio,
    required this.env
  }) {
    _baseUrl = env.baseUrl;
  }

  Future<LocationWeatherModel> getForecasts(Position position) async {
    try {
      Response<dynamic> result = await httpDio.get(
        '$_baseUrl/onecall',
        queryParameters: {
          'lat': position.latitude,
          'lon': position.longitude,
          'dt': DateTime.now().microsecondsSinceEpoch,
          'appid': env.appId,
          'units': 'metric',
          'lang': 'pt_br'
        }
      );

      return LocationWeatherModel.fromJson(result.data);
    } on DioError catch (error) {
      log(error.message);
      throw Exception('Could not get forecasts');
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('UnknownError');
    }
  }
}