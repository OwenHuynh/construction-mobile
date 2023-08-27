import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:construction_mobile/utils/validation/form_status.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:get/get.dart';

class ConstructionInformationController extends GetxController {
  Rx<PageState> pageState = PageState.initial.obs;
  Rx<FormStatus> formStatus = FormStatus.initial.obs;
  RxString webNameObs = ''.obs;
  RxString electricianObs = ''.obs;
  DateTime? startDate;
  DateTime? endDate;
  RxString errorRequiredPersonnelObs = ''.obs;
  RxString errorDateObs = ''.obs;
  RxString ordinaryWorkerObs = ''.obs;
  RxString otherObs = ''.obs;
  RxBool enableButton = false.obs;
  RxBool hiace = false.obs;
  RxBool passenger = false.obs;
  RxBool light = false.obs;

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

  void setHiaceFlag(bool value) {
    hiace.value = value;
  }

  void setPassengerFlag(bool value) {
    passenger.value = value;
  }

  void setLightFlag(bool value) {
    light.value = value;
  }

  void setEnableButton() {
    enableButton.value = !ValidateUtil.isNullOrEmpty(webNameObs.value);
  }

  void onWebNameChange(String name) {
    webNameObs.value = name;
    setEnableButton();
  }

  void onStartDateChange(DateTime date) {
    startDate = date;
  }

  void onEndDateChange(DateTime date) {
    endDate = date;
  }

  void onElectricianChange(String text) {
    electricianObs.value = text;
  }

  void onOrdinaryWorkerChange(String text) {
    ordinaryWorkerObs.value = text;
  }

  void onOtherChange(String id) {
    webNameObs.value = id;
    setEnableButton();
  }

  void clearError() {
    errorRequiredPersonnelObs.value = '';
    errorDateObs.value = '';
  }

  void validateForm() {
    clearError();

    if (startDate == null || endDate == null) {
      errorDateObs.value = 'This field is required!';
    } else if (startDate!.compareTo(endDate!) > 0) {
      errorDateObs.value = 'Error date';
    }

    if (ValidateUtil.isNullOrEmpty(electricianObs.value) ||
        ValidateUtil.isNullOrEmpty(ordinaryWorkerObs.value)) {
      errorRequiredPersonnelObs.value = 'This field is required!';
    }
  }

  void onSubmitConstructionInformation() {
    validateForm();
  }
}
