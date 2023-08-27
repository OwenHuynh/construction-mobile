import 'package:construction_mobile/presentation/components/components.dart';
import 'package:construction_mobile/presentation/components/dialogs/base_dialog.dart';
import 'package:construction_mobile/presentation/components/dialogs/confirm_dialog_custom.dart';
import 'package:construction_mobile/presentation/controllers/reset_password/register_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> showDialog() async {
    await Get.dialog(
      BaseDialog(
        messageText: AppStrings.register_success_label,
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
      ),
    );
  }

  Future<void> showConfirmDialog() async {
    await Get.dialog(
      ConfirmDialogCustom(
        message: AppStrings.register_confirm_message_label,
        dialogStyle: BaseDialogStyle(
          backgroundColor: Colors.grey,
          contentTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            inherit: true,
            fontSize: FontAlias.fontAlias20,
            color: AppColors.colorTextBase,
          ),
        ),
        cancel: 'No',
        confirm: 'Yes',
        onConfirm: () async {
          await showDialog();
          Get.back();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

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
              SpacingAlias.SizeHeight12,
              Obx(
                () => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing80),
                  child: FlatButtonComponent(
                    enabled: controller.enableButton.value,
                    title: AppStrings.register_confirm_label,
                    padding: EdgeInsets.symmetric(
                      vertical: SpacingAlias.Spacing12,
                    ),
                    fontWeight: FontWeight.w500,
                    fontSize: FontAlias.fontAlias36,
                    onPressed: () {
                      controller.registerAction(showConfirmDialog);
                    },
                    color: AppColors.primary_button,
                    borderRadius: RadiusAlias.Radius0,
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
