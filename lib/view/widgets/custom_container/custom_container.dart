import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomContainer extends StatelessWidget {
  final String routeName;
  final String iconSrc;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    this.routeName = '',
    this.iconSrc = AppIcons.notification,
    this.backgroundColor = AppColors.blackLight,
    this.iconColor = AppColors.blackNormal,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: IconButton(
          onPressed: () {
            Get.toNamed(routeName);
          },
          icon: CustomImage(
            imageSrc: iconSrc,
            imageColor: iconColor,
          ),
        ),
      ),
    );
  }
}
