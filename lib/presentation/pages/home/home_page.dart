import 'package:construction_mobile/presentation/components/buttons/flat_button_component.dart';
import 'package:construction_mobile/presentation/controllers/home/home_controller.dart';
import 'package:construction_mobile/presentation/controllers/reset_password/register_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
              FlatButtonComponent(
                title: AppStrings.construction_information_label,
                padding: EdgeInsets.symmetric(
                  vertical: SpacingAlias.Spacing6,
                ),
                fontWeight: FontWeight.w500,
                fontSize: FontAlias.fontAlias28,
                onPressed: controller.goConstructionInformationAction,
                color: AppColors.primary_button,
                borderRadius: RadiusAlias.Radius0,
              ),
              SpacingAlias.SizeHeight80,
              FlatButtonComponent(
                title: AppStrings.process_confirmation_label,
                padding: EdgeInsets.symmetric(
                  vertical: SpacingAlias.Spacing6,
                ),
                fontWeight: FontWeight.w500,
                fontSize: FontAlias.fontAlias28,
                onPressed: controller.goProcessConfirmationAction,
                color: AppColors.primary_button,
                borderRadius: RadiusAlias.Radius0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
