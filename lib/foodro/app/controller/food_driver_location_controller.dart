import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverLocationController extends GetxController {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Timer? timer; // Timer variable
  // Timer variable

  @override
  void onInit() {
    super.onInit();
    updateDriverLocation(37.7749, -122.4194);

    // Start the timer when the controller initializes
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      // Replace these values with actual latitude and longitude received from your backend
      updateDriverLocation(37.7749, -122.4194);
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller; // Store the GoogleMapController instance
  }

  void updateDriverLocation(double lat, double lng) {
    Set<Marker> newMarkers = {
      Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Driver Location'),
      ),
    };
    _updateMarkers(newMarkers);

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16.0,
        ),
      ),
    );
  }

  void _updateMarkers(Set<Marker> newMarkers) {
    markers.clear();
    markers.addAll(newMarkers);
    update();
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is disposed
    timer?.cancel();
    super.onClose();
  }
}
