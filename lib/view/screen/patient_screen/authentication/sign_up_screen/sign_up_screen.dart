import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/main.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///=========================signUp Appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.whiteLightActive,
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.signUp,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///===============================Your Name Here=====================
              CustomFormCard(
                hintText: AppStrings.yourNameHere,
                  title: AppStrings.yourName, controller: TextEditingController()),

              ///===============================dateOfBirth=====================
              CustomFormCard(
                hintText: 'dd/mm/yy',
                  title: AppStrings.dateOfBirth, controller: TextEditingController()),

              ///===============================Email=====================
              CustomFormCard(
                hintText: AppStrings.yourMailHere,
                  title: AppStrings.email, controller: TextEditingController()),

              ///===============================Phone number=====================
              CustomFormCard(
                hintText: AppStrings.yourPhoneNumberHere,
                  title: AppStrings.phoneNumber, controller: TextEditingController()),

              ///===============================Location=====================
              CustomFormCard(
                hintText: AppStrings.typeYourLocationHere,
                  title: AppStrings.location, controller: TextEditingController()),

              ///===============================Password=====================
              CustomFormCard(
                hintText: AppStrings.enterPassword,
                  title: AppStrings.password, controller: TextEditingController()),

              ///===============================confirmPassword=====================
              CustomFormCard(
                  hintText: AppStrings.enterPassword,
                  title: AppStrings.confirmPassword,
                  controller: TextEditingController()),

              ///==========================Continue Button=========================

              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.signUpOtpScreen);
              },
              title: AppStrings.continues,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: AppStrings.alreadyHaveAAccount,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.signInScreen);
                    },
                    child: const CustomText(
                      left: 8,
                      text: AppStrings.signIn,color: AppColors.bluNormalHover,),
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
