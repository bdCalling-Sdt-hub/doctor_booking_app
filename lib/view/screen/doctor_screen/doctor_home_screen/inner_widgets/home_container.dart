import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.5.w,
      height: 142.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.blackNormal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: title,
            fontSize: 13.h,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text: subTitle,
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
