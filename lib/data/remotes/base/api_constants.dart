import 'dart:io';

import 'package:construction_mobile/config/flavors.dart';

class ApiConstants {
  static const String acceptHeader = "Accept";

  static const String applicationJson = "application/json";

  static const String authorizationHeader = "Authorization";

  static String getBaseUrl() {
    return F.baseURL;
  }

  static String getPlatform() {
    if (Platform.isAndroid) {
      return "android";
    }
    return "ios";
  }
}
