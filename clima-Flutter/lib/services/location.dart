
import 'package:geolocator/geolocator.dart';

class Location {

  //Location({required this.latitude,required this.longitude});

  double? latitude, longitude;

  final LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.low, distanceFilter: 100,);

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

      latitude = position.latitude;
      longitude = position.longitude;

    }
    catch (e) {
      print(e);
    }
  }


}