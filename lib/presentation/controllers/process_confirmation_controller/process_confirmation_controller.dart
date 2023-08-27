import 'package:construction_mobile/data/models/argument_model/construction_details_arg.dart';
import 'package:construction_mobile/routes.dart';
import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessConfirmationController extends GetxController {
  Rx<PageState> pageState = PageState.initial.obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<ValueNotifier<List<InfoBox>>> selectedEvents =
      ValueNotifier<List<InfoBox>>([]).obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {
    createEvents();
  }

  void createEvents() {
    try {
      final int dayCurrent = selectedDay.value.day;
      final int numberOfEvents = dayCurrent % 10;
      final List<InfoBox> listEvents = [];
      for (int i = 0; i < numberOfEvents; i++) {
        listEvents.add(InfoBox(
            selectedDay.value.toIso8601String().split("T")[0], 'Nice Day $i'));
      }
      selectedEvents.value = ValueNotifier(listEvents);
    } catch (e) {
      print(e);
    }
  }

  void goConstructionInformationDetailAction(ConstructionDetailsArg args) {
    Get.toNamed(
      AppRoutes.getConstructionInformationDetailRouteName(),
      arguments: args,
    );
  }
}

class InfoBox {
  const InfoBox(this.title, this.body);

  final String title;
  final String body;

  String toTitleString() => title;

  String toBodyString() => body;
}
