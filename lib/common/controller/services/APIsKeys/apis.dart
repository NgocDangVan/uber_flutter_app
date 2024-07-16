import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'keys.dart';

class APIs {
  static geoCoadingAPI(LatLng position) =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapsPlatformCredential';
}
