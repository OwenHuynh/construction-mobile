import 'package:construction_mobile/config/flavors.dart';
import 'package:construction_mobile/construction_mobile_app.dart';
import 'package:construction_mobile/initialize.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  F.appFlavor = Flavor.DEV;
  await initialize();
  runApp(ConstructionMobileApp());
}
