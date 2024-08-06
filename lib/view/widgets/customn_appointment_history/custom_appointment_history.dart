import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_netwrok_image/custom_network_image.dart';

class CustomAppointmentHistory extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String firstProductName;
  final String exchangeProductName;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback onTapName;

  const CustomAppointmentHistory({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    this.backgroundColor = AppColors.white,
    required this.onTap,
    required this.firstProductName,
    required this.exchangeProductName, required this.onTapName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
            border: Border.all(color: AppColors.grayNormal),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                bottom: 10,
                text: AppStrings.appointmentHistory,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
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
                        GestureDetector(
                          onTap:onTapName,
                          child: CustomText(
                            left: 8,
                            text: name,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.bluNormalHover,
                          ),
                        ),
                        CustomText(
                          left: 10,
                          text: date,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: CustomButton(
                      onTap: onTap,
                      title: AppStrings.review,
                      fillColor: AppColors.white,
                      textColor: AppColors.bluNormalHover,
                      isBorder: true,
                    ),
                  ),
                ],
              ),
              const CustomText(
                top: 10,
                left: 7,
                text: AppStrings.searchYourQuestionHere,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: firstProductName,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                   const CustomImage(
                    imageSrc: AppIcons.setting,
                    imageColor: AppColors.black,
                  ),
                  CustomText(
                    text: exchangeProductName,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),

            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}