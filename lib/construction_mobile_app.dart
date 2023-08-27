import 'package:construction_mobile/gen/fonts.gen.dart';
import 'package:construction_mobile/presentation/controllers/construction_mobile/construction_mobile_controller.dart';
import 'package:construction_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class ConstructionMobileApp extends GetView<ConstructionMobileController> {
  const ConstructionMobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: FontFamily.sFProTextRegular),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //const Locale('ja'),
        const Locale('en'),
      ],
      // locale: Locale('ja', 'JP'),
      locale: Locale('en', 'US'),
      initialRoute: AppRoutes.getLoginRouteName(),
      getPages: AppRoutes.routes,
    );
  }
}
