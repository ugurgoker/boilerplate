import 'dart:io';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../core/services/service_firebase.dart';

import '../models/model_token.dart';
import 'general_data.dart';

class Utilities {
  static Future<bool> isOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static dynamic getUserSp(String id, {dynamic defaultValue}) {
    return GeneralData.getInstance().hive.get(id, defaultValue: defaultValue);
  }

  static void setUserSp(String id, dynamic value) async {
    return await GeneralData.getInstance().hive.put(id, value);
  }

  static void openStore() async {
    // await LaunchReview.launch(androidAppId: AppConfig.playStoreId, iOSAppId: AppConfig.appStoreId);
  }

  static Future<String> printIps() async {
    String address = '';
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        address = addr.address;
      }
    }
    return address;
  }

  static List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  static Future<ModelToken?> parseToken(ServiceFirebase serviceFirebase, String? token) async {
    ModelToken? modelToken;
    if (token != null) {
      try {
        var data = convertToJsonForNotEqualQuotes(Jwt.parseJwt(token).toString());
        modelToken = JsonMapper.deserialize<ModelToken>(data);
      } catch (e) {
        serviceFirebase.recordError(error: 'Token: $token ~ Auth Token deserialize error: ${e.toString()}', fatal: true);
      }
    }
    return modelToken;
  }

  static String convertToJsonForNotEqualQuotes(String str) {
    str = str.toString().replaceAll('{', '{"');
    str = str.toString().replaceAll(': ', '": "');
    str = str.toString().replaceAll(', ', '", "');
    str = str.toString().replaceAll('}', '"}');
    return str;
  }
}
