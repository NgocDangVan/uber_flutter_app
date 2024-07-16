import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_uber/common/controller/services/APIsKeys/apis.dart';
import 'package:http/http.dart' as http;
import 'package:rider_uber/common/controller/services/toastService.dart';
import 'package:rider_uber/common/model/pickupNDropLocationModel.dart';

class LocationServices {
  static getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        getCurrentLocation();
      }
    }
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng currentLocation = LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );
    return currentLocation;
  }

  static Future getAddressFromLatLng(
      {required LatLng position, required BuildContext context}) async {
    final api = Uri.parse(APIs.geoCoadingAPI(position));
    try {
      var response = await http
          .get(api, headers: {'Content-Type': 'application/json'}).timeout(
              const Duration(seconds: 60), onTimeout: () {
        ToastService.sendScaffoldAlert(
          msg: 'Opps! Connection Timed Out',
          toastStatus: 'ERROR',
          context: context,
        );
        throw TimeoutException('Connection Timed Out');
      });

      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        PickupNDropLocationModel model = PickupNDropLocationModel(
          decodeResponse['results'][0]['formatted_address'],
          '',
          decodeResponse['results'][0]['place_id'],
          position.latitude.toString(),
          position.longitude.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
