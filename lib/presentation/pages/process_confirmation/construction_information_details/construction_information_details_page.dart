import 'package:construction_mobile/data/models/argument_model/construction_details_arg.dart';
import 'package:construction_mobile/presentation/components/appbar/app_bar_custom.dart';
import 'package:construction_mobile/presentation/components/input/text_form_label.dart';
import 'package:construction_mobile/presentation/controllers/process_confirmation_controller/construction_information_details_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionInformationDetailPage
    extends GetView<ConstructionInformationDetailController> {
  final controller = Get.put(ConstructionInformationDetailController());
  final screenWidth = Get.width;
  final ConstructionDetailsArg args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarCustom(
        title: AppStrings.construction_information_details_label,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingAlias.Spacing18,
          vertical: SpacingAlias.Spacing18,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingAlias.SizeHeight12,
              site_name(),
              SpacingAlias.SizeHeight32,
              date(),
              SpacingAlias.SizeHeight32,
              administrator_area(),
              SpacingAlias.SizeHeight32,
              other(),
            ],
          ),
        ),
      ),
    );
  }

  Widget site_name() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(AppStrings.site_name_label),
        SpacingAlias.SizeHeight12,
        Container(
          width: Get.width,
          alignment: Alignment.center,
          child: label(args.siteName),
        ),
      ],
    );
  }

  Widget date() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(AppStrings.date_label),
        SpacingAlias.SizeHeight12,
        Container(
          width: Get.width,
          alignment: Alignment.center,
          child: label(args.date),
        ),
      ],
    );
  }

  Widget administrator_area() {
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SpacingAlias.Spacing16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label(AppStrings.operator_label),
            SpacingAlias.SizeHeight12,
            Container(
              width: Get.width * 0.5,
              padding: EdgeInsets.only(left: SpacingAlias.Spacing36),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      admin_content_label(args.firstName),
                      admin_content_label(args.secondName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      admin_content_label(args.firstCarName),
                      admin_content_label(args.secondCarName),
                    ],
                  ),
                ],
              ),
            ),
            SpacingAlias.SizeHeight32,
            label(AppStrings.vehicle_label),
            SpacingAlias.SizeHeight12,
            Container(
              width: Get.width * 0.7,
              padding: EdgeInsets.only(left: SpacingAlias.Spacing36),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      admin_content_label(args.firstCar),
                      admin_content_label(args.firstCarNumber),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      admin_content_label(args.secondCar),
                      admin_content_label(args.secondCarNumber),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget other() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(AppStrings.other_label),
        SpacingAlias.SizeHeight12,
        Container(
          width: Get.width,
          alignment: Alignment.center,
          child: label(args.other),
        ),
      ],
    );
  }

  Widget label(String label) {
    return LabelCustom(
      padding: EdgeInsets.zero,
      label: label,
      fontSize: FontAlias.fontAlias20,
      fontWeight: FontWeight.w800,
    );
  }

  Widget admin_content_label(String label) {
    return LabelCustom(
      padding: EdgeInsets.zero,
      label: label,
      color: AppColors.grey,
      fontSize: FontAlias.fontAlias28,
      fontWeight: FontWeight.w800,
    );
  }
}
