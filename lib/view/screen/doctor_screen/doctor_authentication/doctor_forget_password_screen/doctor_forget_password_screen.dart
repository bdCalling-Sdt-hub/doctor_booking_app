import 'package:doctor_booking/core/app_routes/app_routes.dart';

import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorForgetPasswordScreen extends StatelessWidget {
  const DoctorForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///=========================forgotPasswords Appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.whiteLightActive,
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.forgotPasswords,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const CustomText(
              text: AppStrings.forgotPasswords,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.grayNormal,
              bottom: 8,
            ),
            const CustomText(
              text: AppStrings.enterYourEmailAndWeWill,
              maxLines: 2,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
              bottom: 77,
            ),

            ///=========================Email Field Here====================
            CustomFormCard(
                hintText: AppStrings.enterEmailAddress,
                title: AppStrings.email,
                controller: TextEditingController()),

            SizedBox(
              height: 76.h,
            ),

            ///===========================Send A Code Button================
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.doctorResetScreen);
              },
              title: AppStrings.sendACode,
            )
          ],
        ),
      ),
    );
  }
}
