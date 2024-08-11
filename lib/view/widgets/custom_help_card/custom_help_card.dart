import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHelpCard extends StatelessWidget {
  final String contactText;
  final String subText;
  final VoidCallback onTap;

  const CustomHelpCard(
      {required this.contactText,
      required this.subText,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteNormal,
      child: ListTile(
        leading: const CustomImage(imageSrc: AppIcons.customerSupport),
        title: Text(contactText, style: TextStyle(fontSize: 14.sp)),
        subtitle: Text(subText, style: TextStyle(fontSize: 12.sp)),
        onTap: onTap,
      ),
    );
  }
}
