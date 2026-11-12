import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Future<bool> getCurrentLocation()async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
            accuracy: LocationAccuracy.low),);
      latitude = position.latitude;
      longitude = position.longitude;
      return true;
    }
    catch (e) {
      print("getCurrentLocation $e");
      return false;
    }

  }
  }
