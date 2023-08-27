import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:construction_mobile/utils/shared_preferences_util.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtil.getInstance();
  Intl.defaultLocale = 'ja';
}
