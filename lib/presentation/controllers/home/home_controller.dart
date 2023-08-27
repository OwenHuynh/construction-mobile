import 'package:construction_mobile/routes.dart';
import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<PageState> pageState = PageState.initial.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {}

  void goConstructionInformationAction() {
    Get.toNamed(AppRoutes.getConstructionInformationRouteName());
  }

  void goProcessConfirmationAction() {
    Get.toNamed(AppRoutes.getProcessConfirmationRouteName());
  }
}
