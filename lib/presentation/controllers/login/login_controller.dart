import 'package:construction_mobile/presentation/controllers/login/login_validate.dart';
import 'package:construction_mobile/routes.dart';
import 'package:construction_mobile/utils/base/page_state.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:construction_mobile/utils/validation/form_status.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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

  Future<void> loginAction(Function()? showDialog) async {
    final emailValid = LoginValidationResults.validateID(idObs.value).isValid;

    final passwordValid =
        LoginValidationResults.validatePassword(passwordObs.value).isValid;

    final isFormValid = emailValid && passwordValid;

    formStatus.value = isFormValid ? FormStatus.valid : FormStatus.invalid;
    errorMessage.value = getErrorMessage();

    if (isFormValid) {
      // TODO(registerAction): Handle login request - call API
      print(true);

      // TODO(checkFailOrSuccess): check response API
      // if response.status == 200 => go Home
      goHomeAction();
      // else show error dialog
      // if (showDialog != null) {
      //   await showDialog();
      // }
      // Get.back();
    }
  }

  void goRegisterAction() {
    Get.toNamed(AppRoutes.getRegisterRouteName());
  }

  void goHomeAction() {
    Get.toNamed(AppRoutes.getHomeRouteName());
  }
}
