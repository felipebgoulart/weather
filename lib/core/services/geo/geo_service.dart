import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weather/core/services/geo/geo_interface.dart';

class GeoService implements IGeo {

  @override
  Future<Position> getCurrentPosition() async {
    try {
      if (!await hasGeoPermission()) {
        do {
          await Geolocator.requestPermission();
        } while (!await hasGeoPermission());
      }
      
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      return position;
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('Could not get current position');
    }


  }

  @override
  Future<bool> hasGeoPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      String always = LocationPermission.always.name;
      String inUse = LocationPermission.whileInUse.name;
      String denied = LocationPermission.denied.name;
      String deniedForever = LocationPermission.deniedForever.name;
      
      if (permission.name == denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission.name == deniedForever) {
        await Geolocator.openAppSettings();
        permission = await Geolocator.checkPermission();
      }

      if (permission.name == always || permission.name == inUse) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('Could not check permission');
    }
  }
  
}