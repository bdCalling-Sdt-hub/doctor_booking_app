import 'package:doctor_booking/utils/app_colors/app_colors.dart';

import 'package:doctor_booking/utils/app_strings/app_strings.dart';

import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_netwrok_image/custom_network_image.dart';

class CustomAppointmentHistory extends StatelessWidget {
  final String image;
  final String name;
  final String profession;
  final String date;
  final String time;
  final Color backgroundColor;
  final VoidCallback reviewButton;

  const CustomAppointmentHistory({
    super.key,
    required this.image,
    required this.name,
    required this.profession,
    this.backgroundColor = AppColors.white,
    required this.reviewButton,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteNormal,
            border: Border.all(color: AppColors.grayLightHover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: image,
                      height: 36.h,
                      width: 36.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          left: 8,
                          text: name,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grayNormal,
                        ),
                        CustomText(
                          left: 10,
                          text: profession,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarker,
                        ),
                      ],
                    ),
                  ),

                  ///===========================review Button===============
                  GestureDetector(
                    onTap: reviewButton,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppColors.whiteNormal,
                          border: Border.all(color: AppColors.blackLight)),
                      child: const CustomText(
                        text: AppStrings.review,
                        color: AppColors.blackNormal,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomText(
                    text: AppStrings.appointmentTime,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),
                  CustomText(
                    text: date,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grayNormal,
                  ),
                  CustomText(
                    text: date,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grayNormal,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
      ],
    );
  }
}
