import 'package:geolocator/geolocator.dart';

abstract class IGeo {

  Future<Position> getCurrentPosition();

  Future<bool> hasGeoPermission();

}