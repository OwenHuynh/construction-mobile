import 'package:construction_mobile/presentation/theme/spacing_alias.dart';
import 'package:flutter/material.dart';
import 'package:construction_mobile/presentation/components/dialogs/base_dialog.dart';
import 'package:get/get.dart';

class ConfirmDialogCustom extends StatelessWidget {
  const ConfirmDialogCustom({
    required this.cancel,
    required this.confirm,
    this.showIcon = false,
    this.iconWidget,
    this.title,
    this.titleWidget,
    this.message,
    this.messageWidget,
    this.warning,
    this.warningWidget,
    this.barrierDismissible = true,
    this.dialogStyle,
    this.titleMaxLines = 3,
    this.indexedActionClickCallback,
    this.cancelWidget,
    this.confirmWidget,
    this.padding,
    this.onCancel,
    this.onConfirm,
  });

  final String cancel;
  final String confirm;
  final bool showIcon;
  final Image? iconWidget;
  final String? title;
  final Widget? titleWidget;
  final String? message;
  final Widget? messageWidget;
  final String? warning;
  final Widget? warningWidget;
  final Widget? cancelWidget;
  final Widget? confirmWidget;
  final EdgeInsets? padding;
  final BaseDialogStyle? dialogStyle;
  final GestureTapCallback? onCancel;
  final GestureTapCallback? onConfirm;
  final bool barrierDismissible;
  final int titleMaxLines;
  final DialogIndexedActionClickCallback? indexedActionClickCallback;

  Widget build(BuildContext context) {
    final List<Widget> actionsWidget = [];

    if (cancelWidget != null) {
      actionsWidget.add(cancelWidget!);
    }
    if (confirmWidget != null) {
      actionsWidget.add(confirmWidget!);
    }
    return BaseDialog(
      iconImage: iconWidget,
      showIcon: showIcon,
      titleText: title,
      dialogPadding: padding ??
          EdgeInsets.symmetric(
            horizontal: SpacingAlias.Spacing60,
          ),
      titleWidget: titleWidget,
      messageText: message,
      contentWidget: messageWidget,
      warningWidget: warningWidget,
      warningText: warning,
      titleMaxLines: titleMaxLines,
      dialogStyle: dialogStyle,
      rightMainButton: false,
      actionsText: [confirm, cancel],
      actionsWidget: actionsWidget,
      indexedActionCallback: (index) {
        if (index == 0) {
          Get.back();
          if (onConfirm != null) {
            onConfirm!();
          }
        }
        if (index == 1) {
          if (onCancel != null) {
            onCancel!();
          } else {
            Get.back();
          }
        }
      },
    );
  }
}
