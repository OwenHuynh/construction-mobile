import 'package:construction_mobile/presentation/components/input/text_form_label.dart';
import 'package:construction_mobile/presentation/controllers/process_confirmation_controller/process_confirmation_controller.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';
import 'package:flutter/material.dart';

class CalendarDetail extends StatelessWidget {
  const CalendarDetail({super.key, required this.box});

  final InfoBox box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(box.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            label(
              'This is your choice',
            ),
            label(
              'This is your choice',
            ),
            Text(
              box.body,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String label) {
    return LabelCustom(
      padding: EdgeInsets.zero,
      label: label,
      textAlign: TextAlign.start,
      fontSize: FontAlias.fontAlias20,
      fontWeight: FontWeight.w800,
    );
  }
}
