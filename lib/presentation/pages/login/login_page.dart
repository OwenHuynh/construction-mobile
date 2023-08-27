import 'package:construction_mobile/presentation/components/components.dart';
import 'package:construction_mobile/presentation/components/dialogs/base_dialog.dart';
import 'package:construction_mobile/presentation/controllers/login/login_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> showDialog() async {
    await Get.dialog(
        BaseDialog(
          messageText: AppStrings.failed_login_label,
          borderRadiusDialog: 0,
          dialogStyle: BaseDialogStyle(
            backgroundColor: Colors.grey,
            contentTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              inherit: true,
              fontSize: FontAlias.fontAlias20,
              color: AppColors.colorTextBase,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingAlias.SizeHeight18,
              LabelCustom(
                padding: EdgeInsets.zero,
                label: AppStrings.id_label,
                fontSize: FontAlias.fontAlias20,
                fontWeight: FontWeight.w800,
              ),
              SpacingAlias.SizeHeight4,
              Obx(
                () => TextFormFieldCustom(
                  controller: idController,
                  obscureText: true,
                  onChanged: controller.onIDChange,
                  suffixIcon:
                      !ValidateUtil.isNullOrEmpty(controller.idObs.value)
                          ? CircleIconButton(
                              onPressed: () {
                                idController.clear();
                                controller.onIDChange("");
                              },
                              icon: Icons.clear,
                            )
                          : null,
                ),
              ),
              SpacingAlias.SizeHeight32,
              LabelCustom(
                padding: EdgeInsets.zero,
                label: AppStrings.password_title_label,
                fontSize: FontAlias.fontAlias20,
                fontWeight: FontWeight.w800,
              ),
              SpacingAlias.SizeHeight4,
              Obx(
                () => TextFormFieldCustom(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: controller.onPasswordChange,
                  suffixIcon:
                      !ValidateUtil.isNullOrEmpty(controller.passwordObs.value)
                          ? CircleIconButton(
                              onPressed: () {
                                passwordController.clear();
                                controller.onPasswordChange("");
                              },
                              icon: Icons.clear,
                            )
                          : null,
                ),
              ),
              SpacingAlias.SizeHeight16,
              Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.center,
                child: Obx(
                  () => LabelCustom(
                    padding: EdgeInsets.zero,
                    textAlign: TextAlign.center,
                    label: controller.errorMessage.value,
                    fontSize: FontAlias.fontAlias12,
                    color: AppColors.redError,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SpacingAlias.SizeHeight20,
              Obx(
                () => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing80),
                  child: FlatButtonComponent(
                    enabled: controller.enableButton.value,
                    title: AppStrings.login_confirm_label,
                    padding: EdgeInsets.symmetric(
                      vertical: SpacingAlias.Spacing12,
                    ),
                    fontWeight: FontWeight.w500,
                    fontSize: FontAlias.fontAlias36,
                    onPressed: () {
                      controller.loginAction(showDialog);
                    },
                    color: AppColors.primary_button,
                    borderRadius: RadiusAlias.Radius0,
                  ),
                ),
              ),
              SpacingAlias.SizeHeight20,
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: controller.goRegisterAction,
                  child: LabelCustom(
                    padding: EdgeInsets.zero,
                    textAlign: TextAlign.center,
                    label: AppStrings.register_button_text_label,
                    fontSize: FontAlias.fontAlias24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary_text_button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
