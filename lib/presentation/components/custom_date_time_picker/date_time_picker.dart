import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/radius_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePickerCustom extends StatefulWidget {
  const DateTimePickerCustom({
    required this.onSelectDateTime,
    this.selectedDate,
    this.fontSize,
    this.widthContainer = 150,
    this.heightContainer,
    this.minDate,
  });

  final DateTime? selectedDate;
  final DateTime? minDate;
  final ValueChanged<DateTime> onSelectDateTime;
  final double? fontSize;
  final double? widthContainer;
  final double? heightContainer;

  @override
  State<DateTimePickerCustom> createState() => _DateTimePickerCustomState();
}

class _DateTimePickerCustomState extends State<DateTimePickerCustom> {
  final screenWidth = Get.width;
  DateTime? _selectedDate;
  DateTime? _changedDate;

  @override
  void initState() {
    setState(() {
      _selectedDate = widget.selectedDate;
      _changedDate = DateTime.now();
    });
    super.initState();
  }

  Future<void> showDateTimePicker() async {
    // await Get.dialog(
    //   DatePickerDialog(
    //     restorationId: 'date_picker_dialog',
    //     initialEntryMode: DatePickerEntryMode.calendarOnly,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2020),
    //     lastDate: DateTime(2025),
    //   ),);

    await Get.bottomSheet(
      enterBottomSheetDuration: Duration(milliseconds: 200),
      exitBottomSheetDuration: Duration(milliseconds: 200),
      Container(
        height: Get.height * 0.35,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: Get.back,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: FontAlias.fontAlias15,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate = _changedDate;
                        widget.onSelectDateTime(_selectedDate!);
                      });
                      Get.back();
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: FontAlias.fontAlias15,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  dateOrder: DatePickerDateOrder.ymd,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: widget.minDate,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() => _changedDate = newDateTime);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDateTimePicker,
      child: Container(
        width: widget.widthContainer,
        height: widget.heightContainer,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(SpacingAlias.Spacing16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(RadiusAlias.Radius8)),
          border: Border.all(
            width: 4,
            color: AppColors.primary_text_button,
          ),
        ),
        child: Center(
          child: Text(
            _selectedDate != null
                ? _selectedDate!.toIso8601String().split("T")[0]
                : "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: widget.fontSize ??
                    (screenWidth < 430
                        ? FontAlias.fontAlias12
                        : FontAlias.fontAlias16)),
          ),
        ),
      ),
    );
  }
}
