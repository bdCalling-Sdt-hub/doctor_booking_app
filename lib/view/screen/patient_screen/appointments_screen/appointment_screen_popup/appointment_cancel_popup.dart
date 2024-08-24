import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCancelPopup extends StatelessWidget {
  const AppointmentCancelPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomImage(
              imageSrc: AppIcons.close,
              size: 16,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomText(
          text: AppStrings.areYouSure,
          fontSize: 14.w,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
          maxLines: 2,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomText(
          text: AppStrings.ifYouCancel,
          fontSize: 10.w,
          fontWeight: FontWeight.w400,
          color: AppColors.grayNormal,
          maxLines: 5,
          bottom: 14.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: MediaQuery.sizeOf(context).width / 3,
              onTap: () {
                Navigator.pop(context);
              },
              title: AppStrings.cancel,
              fillColor: AppColors.whiteNormal,
              isBorder: true,
              textColor: AppColors.blackNormal,
            ),
            CustomButton(
              width: MediaQuery.sizeOf(context).width / 3,
              onTap: () {
                Navigator.pop(context);
              },
              title: AppStrings.confirm,
              fillColor: AppColors.blackNormal,
              textColor: AppColors.whiteNormal,
            ),
          ],
        ),
      ],
    );
  }
}
