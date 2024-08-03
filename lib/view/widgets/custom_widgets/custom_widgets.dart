import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

import '../custom_text_field/custom_text_field.dart';

class CustomWidgets {

  ///==============================Custom side drawer=========================
  Widget customRow(
      {
        required String title,
        required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child:   CustomText(
            color: AppColors.appBarBackground,
            left: 16.w,
            text: title,
            fontSize: 12.w,
          )
        ),
      );


  ///================================Custom Profile===================
  Widget customProfile({
    required String title,
    required String subTitle
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            color: AppColors.black,
            text: title,
            fontWeight: FontWeight.w400,
            fontSize: 16.w,
            bottom: 8,
          ),
          CustomText(
            color: AppColors.normalBlack,
            text: subTitle,
            fontWeight: FontWeight.w400,
            fontSize: 14.w,
            bottom: 20,
          ),

        ],
      );

  ///================================Custom EditProfile===================
  Widget customEditProfile({
    required String title,
    required TextEditingController controller,

  })

  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: AppColors.black,
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 16.w,
          bottom: 8,
        ),
        CustomTextField(
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.white),
          fillColor: AppColors.selectNavbarColor,
          fieldBorderColor: AppColors.borderColor,
          keyboardType: TextInputType.name,
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }

}