import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Position? position;
  LocationPermission? permission;

  getPermission() async {
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
      // print("permission granted");
    } catch (e) {
      print(e);
    }
  }

  getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position?.latitude;
      longitude = position?.longitude;
      // print("Got location");
    } catch (e) {
      print(e);
    }
  }
}
