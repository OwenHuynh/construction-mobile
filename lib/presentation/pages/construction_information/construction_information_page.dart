import 'package:construction_mobile/presentation/components/appbar/app_bar_custom.dart';
import 'package:construction_mobile/presentation/components/buttons/flat_button_component.dart';
import 'package:construction_mobile/presentation/components/check_box/label_check_box.dart';
import 'package:construction_mobile/presentation/components/custom_date_time_picker/construction_date.dart';
import 'package:construction_mobile/presentation/components/icons/circle_icon_button.dart';
import 'package:construction_mobile/presentation/components/input/text_form_field_custom.dart';
import 'package:construction_mobile/presentation/components/input/text_form_label.dart';
import 'package:construction_mobile/presentation/controllers/construction_information/construction_information_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionInformationPage
    extends GetView<ConstructionInformationController> {
  final TextEditingController webNameController = TextEditingController();
  final TextEditingController electricianController = TextEditingController();
  final TextEditingController ordinaryWorkerController =
      TextEditingController();
  final TextEditingController otherController = TextEditingController();
  final controller = Get.put(ConstructionInformationController());
  final screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarCustom(
        title: AppStrings.construction_information_label,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingAlias.Spacing18,
            vertical: SpacingAlias.Spacing18,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                web_name(),
                SpacingAlias.SizeHeight32,
                construction_date(),
                SpacingAlias.SizeHeight20,
                required_personnel_component(),
                SpacingAlias.SizeHeight20,
                vehicle(),
                SpacingAlias.SizeHeight20,
                other_text_field(),
                SpacingAlias.SizeHeight32,
                Obx(
                  () => FlatButtonComponent(
                    enabled: controller.enableButton.value,
                    title: AppStrings.process_confirmation_label,
                    padding: EdgeInsets.symmetric(
                      vertical: SpacingAlias.Spacing6,
                    ),
                    fontWeight: FontWeight.w500,
                    fontSize: FontAlias.fontAlias28,
                    onPressed: controller.onSubmitConstructionInformation,
                    color: AppColors.primary_button,
                    borderRadius: RadiusAlias.Radius0,
                  ),
                ),
                SpacingAlias.SizeHeight32,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget web_name() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label_header(AppStrings.web_name_label),
        SpacingAlias.SizeHeight4,
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingAlias.Spacing18,
            ),
            child: TextFormFieldCustom(
              controller: webNameController,
              onChanged: controller.onWebNameChange,
              suffixIcon:
                  !ValidateUtil.isNullOrEmpty(controller.webNameObs.value)
                      ? CircleIconButton(
                          onPressed: () {
                            webNameController.clear();
                            controller.onWebNameChange("");
                          },
                          icon: Icons.clear,
                        )
                      : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget construction_date() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label_header(AppStrings.date_label),
        SpacingAlias.SizeHeight12,
        ConstructionDate(
          onSelectFirstDateTime: controller.onStartDateChange,
          onSelectSecondDateTime: controller.onEndDateChange,
          padding: EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing28),
        ),
        Obx(
          () => controller.errorDateObs.value != ''
              ? Obx(() => error_label(controller.errorDateObs.value))
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget label_with_textInput(String label,
      TextEditingController textController, Function(String)? onchange) {
    return Row(
      children: [
        label_header(label),
        SpacingAlias.SizeWidth8,
        Container(
          width: screenWidth * 0.2,
          child: TextFormField(
            controller: textController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: (screenWidth < 430
                    ? FontAlias.fontAlias12
                    : FontAlias.fontAlias16)),
            maxLength: 5,
            onChanged: onchange,
            decoration: InputDecoration(
              counterText: AppStrings.empty,
              contentPadding: EdgeInsets.symmetric(
                horizontal: SpacingAlias.Spacing12,
                vertical: SpacingAlias.Spacing16,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary_text_button,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary_text_button,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary_text_button,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget required_personnel_component() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label_header(AppStrings.required_personnel_label),
        SpacingAlias.SizeHeight20,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              label_with_textInput(
                AppStrings.electrician_label,
                electricianController,
                controller.onElectricianChange,
              ),
              label_with_textInput(
                AppStrings.ordinary_worker_label,
                ordinaryWorkerController,
                controller.onOrdinaryWorkerChange,
              ),
            ],
          ),
        ),
        Obx(
          () => controller.errorRequiredPersonnelObs.value != ''
              ? Obx(
                  () => error_label(controller.errorRequiredPersonnelObs.value))
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget vehicle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label_header(AppStrings.vehicle_label),
        SpacingAlias.SizeHeight12,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing28),
          child: Column(
            children: [
              LabelCheckBox(
                label: AppStrings.hiace_vehicle_label,
                onChanged: controller.setHiaceFlag,
              ),
              LabelCheckBox(
                label: AppStrings.passenger_car_vehicle_label,
                onChanged: controller.setPassengerFlag,
              ),
              LabelCheckBox(
                label: AppStrings.light_vehicle_label,
                onChanged: controller.setLightFlag,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget other_text_field() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label_header(AppStrings.other_label),
        SpacingAlias.SizeHeight12,
        Container(
          child: TextFormField(
            controller: otherController,
            maxLines: 3,
            style: TextStyle(
              fontSize: FontAlias.fontAlias20,
              fontWeight: FontWeight.w800,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: SpacingAlias.Spacing12,
                vertical: SpacingAlias.Spacing16,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary_text_button,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary_text_button,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  RadiusAlias.Radius8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget label_header(String label) {
    return LabelCustom(
      padding: EdgeInsets.zero,
      label: label,
      fontSize: FontAlias.fontAlias20,
      fontWeight: FontWeight.w800,
    );
  }

  Widget error_label(String label) {
    return Container(
      width: double.infinity,
      height: 30,
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: LabelCustom(
        padding: EdgeInsets.zero,
        textAlign: TextAlign.center,
        label: label,
        fontSize: FontAlias.fontAlias12,
        color: AppColors.redError,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
