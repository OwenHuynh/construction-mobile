import 'package:construction_mobile/presentation/controllers/reset_password/register_validate.dart';
import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:construction_mobile/utils/validation/form_status.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<PageState> pageState = PageState.initial.obs;
  RxString idObs = ''.obs;
  RxString passwordObs = ''.obs;
  Rx<FormStatus> formStatus = FormStatus.initial.obs;
  RxBool enableButton = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    Init();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> Init() async {}

  void onIDChange(String id) {
    idObs.value = id;
    setEnableButton();
  }

  void onPasswordChange(String password) {
    passwordObs.value = password;
    setEnableButton();
  }

  void setEnableButton() {
    enableButton.value = !ValidateUtil.isNullOrEmpty(idObs.value) &&
        !ValidateUtil.isNullOrEmpty(passwordObs.value);
  }

  String getErrorMessage() {
    switch (formStatus.value) {
      case FormStatus.initial:
        return AppStrings.empty;
      case FormStatus.invalid:
        return AppStrings.login_error_label;
      case FormStatus.valid:
        return AppStrings.empty;
    }
  }

  Future<void> registerAction(Function? showDialog) async {
    final emailValid =
        RegisterValidationResults.validateID(idObs.value).isValid;

    final passwordValid =
        RegisterValidationResults.validatePassword(passwordObs.value).isValid;

    final isFormValid = emailValid && passwordValid;

    formStatus.value = isFormValid ? FormStatus.valid : FormStatus.invalid;
    errorMessage.value = getErrorMessage();

    if (isFormValid) {
      // TODO(registerAction): Handle register request - call API
      if (showDialog != null) {
        print(true);
        await showDialog();
      }
      //Get.back();
    }
  }
}
