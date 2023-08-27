import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:get/get.dart';

class ConstructionMobileController extends GetxController {
  RxBool isLogged = false.obs;
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
}
