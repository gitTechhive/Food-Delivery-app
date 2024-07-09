import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

import '../model/my_location_model.dart';

class FoodLocationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  FocusNode f1 = FocusNode();

  var locationData = MyLocation(latitude: 0, longitude: 0).obs;
  var currentAddress = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    loc.Location location = loc.Location();
    try {
      var currentLocation = await location.getLocation();
      locationData.value = MyLocation(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
      );

      getAddressFromLatLng(
          locationData.value.latitude, locationData.value.longitude);
      addressController.text = currentAddress.value;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting location: $e');
      }
    }
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark placemark = placemarks[0];
      String address =
          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
      currentAddress.value = address;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting address from coordinates: $e");
      }
      currentAddress.value = '';
    }
  }
}
