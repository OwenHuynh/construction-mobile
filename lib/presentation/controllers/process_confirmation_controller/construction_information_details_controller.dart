import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:get/get.dart';

class ConstructionInformationDetailController extends GetxController {
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

  Future<void> init() async {
    getArgs();
  }

  void getArgs() {
    final args = Get.arguments;
  }
}
