import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/core/drivers/env_interface.dart';
import 'package:weather/core/services/dio/dio_interface.dart';
import 'package:weather/src/modules/forecast_location/models/city_model.dart';

class ForecastLocationRepository {
  final IDio httpDio;
  final IEnvironment env;
  late final String _baseUrl;

  ForecastLocationRepository({
    required this.httpDio,
    required this.env
  }) {
    _baseUrl = env.baseUrlMap;
  }

  Future<List<CityModel>> findCities(String query) async {
    try {
      if (query.isEmpty) return <CityModel> [];

      Response<dynamic> result = await httpDio.get(
        '$_baseUrl/direct',
        // ignore: always_specify_types
        queryParameters: {
          'q': query,
          'limit': 5,
          'appid': env.appId
        }
      );

      return (result.data as List<dynamic>?)?.map((dynamic x) => CityModel.fromJson(x)).toList() ?? List<CityModel>.empty();
    } on DioError catch (error) {
      log(error.message);
      throw Exception('Could not find any city');
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('UnknownError');
    }
  }
}