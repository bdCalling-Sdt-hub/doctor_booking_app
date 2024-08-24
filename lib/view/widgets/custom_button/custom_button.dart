import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = '',
    this.marginVerticel = 0,
    this.marginHorizontal = 0,
    this.fillColor = AppColors.blackNormal,
    this.textColor = AppColors.whiteNormal,
    this.isBorder = false,
  });

  final double height;
  final double width;
  final Color? fillColor;
  final Color textColor;
  final bool isBorder;

  final VoidCallback onTap;

  final String title;

  final double marginVerticel;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVerticel, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: isBorder ? Border.all(color: textColor) : null,
            borderRadius: BorderRadius.circular(100),
            color: fillColor),
        child: CustomText(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
            textAlign: TextAlign.center,
            text: title),
      ),
    );
  }
}
