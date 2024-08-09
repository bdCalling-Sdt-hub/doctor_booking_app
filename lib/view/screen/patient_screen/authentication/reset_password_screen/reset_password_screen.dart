import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///===========================New Password Appbar===================
      appBar: AppBar(
        backgroundColor: AppColors.whiteLightActive,
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.newPassword,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Column(
          children: [
            const CustomText(
              text: AppStrings.setANewPassword,
              color: AppColors.grayNormal,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              bottom: 12,
            ) ,const CustomText(
              text: AppStrings.createANewPasswordEnsureIt,
              color: AppColors.whiteDarker,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              bottom: 55,
              maxLines: 3,
            ),
            ///============================New Password Field=================
            CustomFormCard(
                hintText: AppStrings.enterNewPassword,
                title: AppStrings.newPassword, controller: TextEditingController()),

            ///============================Confirm Password Field=================
            CustomFormCard(
                hintText: AppStrings.enterNewPassword,
                title: AppStrings.confirmPassword, controller: TextEditingController()),

            ///==============================Update Password button=============
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.signInScreen);
            },title: AppStrings.updatePassword,)
          ],
        ),
      ),
    );
  }
}
