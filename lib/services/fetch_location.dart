import 'dart:io';

import 'package:location/location.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';

class FindMyLocation {
  static getCurrantLocation() async {
    Location location = Location();
    bool serviceEnabled = false;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    ///check location is on or off
    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled == false) {
      serviceEnabled = await location.requestService();
      if (serviceEnabled == false) {
        return;
      }
    }

    ///check location permission is given to app or not
    permissionGranted = await location.hasPermission();

    switch (permissionGranted) {
      case PermissionStatus.denied:
        permissionGranted = await location.requestPermission();

        if (permissionGranted == PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted == PermissionStatus.deniedForever) {
            _openAppSettings();
          }
        }
        break;

      case PermissionStatus.deniedForever:
        return _openAppSettings();

      case PermissionStatus.granted:
        locationData = await location.getLocation();
        return locationData;

      case PermissionStatus.grantedLimited:
        return _openAppSettings();

      default:
        return _openAppSettings();
    }
  }

  static _openAppSettings() async {
    if (Platform.isAndroid) {
      OpenSettingsPlusAndroid openSettingsPlusAndroidObject =
          const OpenSettingsPlusAndroid();
      openSettingsPlusAndroidObject.applicationDetails();
    } else if (Platform.isIOS) {
      OpenSettingsPlusIOS openSettingsPlusIOSObject =
          const OpenSettingsPlusIOS();
      openSettingsPlusIOSObject.appSettings();
    }
  }
}
