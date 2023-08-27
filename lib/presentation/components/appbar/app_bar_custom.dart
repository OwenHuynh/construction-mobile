import 'package:flutter/material.dart';
import 'package:construction_mobile/gen/fonts.gen.dart';
import 'package:construction_mobile/presentation/theme/colors.dart';
import 'package:construction_mobile/presentation/theme/font_alias.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    this.title = "",
  });

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontFamily.sFProTextRegular,
          color: AppColors.white,
          fontSize: FontAlias.fontAlias16,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
    );
  }
}
