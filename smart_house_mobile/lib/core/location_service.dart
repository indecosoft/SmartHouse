import 'package:Homey/core/business_exception.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

@riverpod
Future<Placemark?> geocodedLocation(GeocodedLocationRef ref) async {
  loc.Location location = loc.Location();

  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      throw LocationServiceException();
    }
  }
  loc.PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == loc.PermissionStatus.deniedForever) {
    throw LocationPermissionException();
  }
  if (permissionGranted == loc.PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != loc.PermissionStatus.granted &&
        permissionGranted != loc.PermissionStatus.grantedLimited) {
      throw LocationPermissionException();
    }
  }
  final currentLocation = await location.getLocation();
  if (currentLocation.latitude == null || currentLocation.longitude == null) {
    throw FailedToRetrieveLocationException();
  }
  return (await placemarkFromCoordinates(
          currentLocation.latitude!, currentLocation.longitude!,
          localeIdentifier: 'en_us'))
      .firstOrNull;
}

@riverpod
Future<bool> requestLocationPermission(RequestLocationPermissionRef ref) async {
  loc.Location location = loc.Location();

  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      throw LocationServiceException();
    }
  }
  loc.PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == loc.PermissionStatus.deniedForever) {
    throw LocationPermissionException();
  }
  if (permissionGranted == loc.PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != loc.PermissionStatus.granted &&
        permissionGranted != loc.PermissionStatus.grantedLimited) {
      throw LocationPermissionException();
    }
  }
  final currentLocation = await location.getLocation();
  if (currentLocation.latitude == null || currentLocation.longitude == null) {
    throw FailedToRetrieveLocationException();
  }
  return true;
}
