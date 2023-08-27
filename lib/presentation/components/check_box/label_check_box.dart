import 'package:construction_mobile/presentation/components/input/text_form_label.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelCheckBox extends StatefulWidget {
  const LabelCheckBox({
    this.label = '',
    required this.onChanged,
    this.padding,
    this.fontSize,
  });

  final String label;
  final double? fontSize;
  final ValueChanged<bool> onChanged;
  final EdgeInsets? padding;

  @override
  State<LabelCheckBox> createState() => _LabelCheckBoxState();
}

class _LabelCheckBoxState extends State<LabelCheckBox> {
  bool isChecked = false;

  Widget build(BuildContext context) {
    final screenWidth = Get.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      if (!isChecked) {
        return Colors.black;
      }
      return Colors.green;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: LabelCustom(
            padding: EdgeInsets.zero,
            label: widget.label,
            fontSize: widget.fontSize ?? FontAlias.fontAlias16,
            fontWeight: FontWeight.w800,
          ),
        ),
        SpacingAlias.SizeWidth20,
        Expanded(
          flex: 1,
          child: Transform.scale(
            scale: isChecked ? 1 : 0.6,
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isChecked ? 3 : 0),
              ),
              side: BorderSide(
                width: 1,
              ),
              value: isChecked,
              onChanged: (bool? value) {
                widget.onChanged(value!);
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}
