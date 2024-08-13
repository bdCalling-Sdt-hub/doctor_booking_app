import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_spacer_widget/custom_spacer_widget.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorSignInScreen extends StatelessWidget {
  const DoctorSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///=========================Sign In Appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.whiteLightActive,
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.signIn,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const CustomImage(
                imageSrc: AppImages.ilera,
                imageType: ImageType.png,
              ),
              CustomText(
                top: 24.h,
                text: AppStrings.signIn,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.grayNormal,
                bottom: 92.h,
              ),

              ///=================================Email Address==================
              CustomFormCard(
                  hintText: AppStrings.enterEmailAddress,
                  title: AppStrings.emailAddress,
                  controller: TextEditingController()),

              ///=================================password==================
              CustomFormCard(
                  isPassword: true,
                  hintText: AppStrings.enterPassword,
                  title: AppStrings.password,
                  controller: TextEditingController()),
              Row(
                children: [
                  const SpacerWidget(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.doctorForgetPasswordScreen);
                    },
                    child: CustomText(
                      top: 8.h,
                      text: AppStrings.forgotPassword,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteDarker,
                      bottom: 45,
                    ),
                  ),
                ],
              ),

              ///================================Continue Button===================
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.doctorHomeScreen);
                },
                title: AppStrings.continues,
              ),

              SizedBox(
                height: 33.h,
              ),
              Row(
                children: [
                  const CustomText(
                    text: AppStrings.dontHaveAnAccount,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),

                  ///========================Create Account===================
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.doctorSignUp);
                    },
                    child: const CustomText(
                      left: 8,
                      text: AppStrings.createAccount,
                      color: AppColors.bluNormalHover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
