import 'package:construction_mobile/presentation/components/custom_date_time_picker/date_time_picker.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructionDate extends StatelessWidget {
  const ConstructionDate({
    required this.onSelectFirstDateTime,
    required this.onSelectSecondDateTime,
    this.padding,
  });

  final ValueChanged<DateTime> onSelectFirstDateTime;
  final ValueChanged<DateTime> onSelectSecondDateTime;
  final EdgeInsets? padding;

  Widget build(BuildContext context) {
    final screenWidth = Get.width;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateTimePickerCustom(
            onSelectDateTime: onSelectFirstDateTime,
            widthContainer: screenWidth * 0.32,
          ),
          Text(
            '~',
            style: TextStyle(
              fontSize: FontAlias.fontAlias28,
              fontWeight: FontWeight.bold,
            ),
          ),
          DateTimePickerCustom(
            onSelectDateTime: onSelectSecondDateTime,
            widthContainer: screenWidth * 0.32,
          ),
        ],
      ),
    );
  }
}
