import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Position position = await Geolocator()
      //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = 51.5074;
      longitude = 0.1278;
    } catch (e) {
      print(e);
    }
  }
}
