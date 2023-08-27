import 'package:construction_mobile/data/models/argument_model/construction_details_arg.dart';
import 'package:construction_mobile/presentation/components/appbar/app_bar_custom.dart';
import 'package:construction_mobile/presentation/components/calendar/calendar_custom.dart';
import 'package:construction_mobile/presentation/components/input/text_form_label.dart';
import 'package:construction_mobile/presentation/controllers/process_confirmation_controller/process_confirmation_controller.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:construction_mobile/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ProcessConfirmationPage extends GetView<ProcessConfirmationController> {
  final controller = Get.put(ProcessConfirmationController());
  final screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarCustom(
        title: AppStrings.process_confirmation_label,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingAlias.Spacing18,
          vertical: SpacingAlias.Spacing18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CalendarCustom(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: controller.selectedDay.value,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.createEvents();
                },
                //locale: 'ja_JP',
                locale: 'en_US',
              ),
            ),
            SpacingAlias.SizeHeight12,
            Expanded(
              child: Obx(
                () => ValueListenableBuilder<List<InfoBox>>(
                  valueListenable: controller.selectedEvents.value,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return calendar_events_list(context, value[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calendar_events_list(BuildContext context, InfoBox item) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: SpacingAlias.Spacing12,
        vertical: SpacingAlias.Spacing4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
        ),
        borderRadius: BorderRadius.circular(RadiusAlias.Radius25),
      ),
      child: ListTile(
        onTap: () {
          final args = ConstructionDetailsArg(
            siteName: '●●●●●●改修工事',
            date: '2021年9月2日(月)',
            other: '●●方面へ出張',
            firstName: '杉山',
            secondName: '佐藤',
            firstCarName: '鈴木',
            secondCarName: '山田',
            firstCar: 'ハイエース',
            firstCarNumber: '66-06',
            secondCar: 'ハイゼット',
            secondCarNumber: '72-80',
          );
          controller.goConstructionInformationDetailAction(args);
        },
        title: Padding(
          padding: const EdgeInsets.all(SpacingAlias.Spacing8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LabelCustom(
                    padding: EdgeInsets.zero,
                    label: AppStrings.site_name_label,
                    fontSize: FontAlias.fontAlias16,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
              SpacingAlias.SizeHeight8,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelCustom(
                    padding: EdgeInsets.zero,
                    label: '●●●●新築工事',
                    fontSize: FontAlias.fontAlias16,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
              SpacingAlias.SizeHeight8,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LabelCustom(
                    padding: EdgeInsets.zero,
                    label: '入力者;鈴木',
                    fontSize: FontAlias.fontAlias16,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
