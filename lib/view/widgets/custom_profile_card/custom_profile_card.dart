import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_text/custom_text.dart';

class CustomProfileCard extends StatelessWidget {
  final String text;
  final String leadingIcon;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isCevron;
  final bool isBorder;

  const CustomProfileCard({
    super.key,
    required this.text,
    required this.leadingIcon,
    this.backgroundColor = AppColors.whiteNormal,
    required this.onTap,
    this.isCevron = false,
    this.isBorder = false, // Corrected to handle default null value properly
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 54.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
              border: isBorder ? Border.all(color: AppColors.grayLightHover) : null, // Corrected border handling
            ),
            child: Row(
              children: [
                CustomImage(imageSrc: leadingIcon),
                const SizedBox(width: 10),
                CustomText(
                  text: text,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const Spacer(),
                if (isCevron)
                  const CustomImage(imageSrc: AppIcons.arrowForwardIos),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
