import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:patidayanisma/theme/colors.dart';

class GpsButton extends StatelessWidget {
  Future<LocationPermission> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<Position?> _getCurrentLocation() async {
    LocationPermission permission = await _checkLocationPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      return position;
    }
    return null;
  }

  const GpsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getCurrentLocation,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: primaryBlueColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primaryBlueColor,
          ),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.white,
          size: 31,
        ),
      ),
    );
  }
}
