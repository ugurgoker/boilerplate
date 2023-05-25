import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_mac_address/get_mac_address.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../utils/utilities.dart';

class ServiceDeviceInfo extends ChangeNotifier {
  String deviceId = '';

  String ipAddress = '';
  String macAddress = '';

  String playStoreId = ''; //todo add play store id
  String appStoreId = ''; //todo add app store id

  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;

  String version = '';
  int buildNumber = 0;

  ServiceDeviceInfo() {
    initialize();
  }

  Future<void> initialize() async {
    deviceId = (await PlatformDeviceId.getDeviceId) ?? '';
    log(deviceId, name: 'Device Id');
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    } else {
      iosInfo = await deviceInfo.iosInfo;
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = int.parse(packageInfo.buildNumber);
    log(version, name: Platform.isIOS ? 'iOS Version' : 'Android Version');
    log(buildNumber.toString(), name: 'Build Number');

    ipAddress = await Utilities.printIps();
    macAddress = await GetMacAddress().getMacAddress() ?? '';

    log(ipAddress, name: 'Ip Address');
    log(macAddress, name: 'Mac Address');
  }
}