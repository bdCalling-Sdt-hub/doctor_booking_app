import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/controller/patient_auth_controller/patient_auth_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_spacer_widget/custom_spacer_widget.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();

  final PatientAuthController patientAuthController =
      Get.find<PatientAuthController>();

  // TextEditingControllers for managing form input

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 10.h),
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
                // Email Address Field
                CustomFormCard(
                  hintText: AppStrings.enterEmailAddress,
                  title: AppStrings.emailAddress,
                  controller: patientAuthController.emailController,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (!AppStrings.emailRegexp
                        .hasMatch(patientAuthController.emailController.text)) {
                      return AppStrings.enterValidEmail.tr;
                    }
                    return null;
                  },
                ),
                // Password Field
                CustomFormCard(
                  isPassword: true,
                  hintText: AppStrings.enterPassword,
                  title: AppStrings.password,
                  controller: patientAuthController.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 7 &&
                        !AppStrings.passRegexp.hasMatch(value)) {
                      return AppStrings.passwordMustHaveEightWith.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: [
                    const SpacerWidget(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgetPasswordScreen);
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
                //======================================= Sign in button ===========================//
                Obx(() {
                  return patientAuthController.signInLoading.value
                      ? const CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              patientAuthController.signInUser();
                            }
                            //  patientAuthController.signInUser();
                          },
                          title: AppStrings.continues,
                        );
                }),
                SizedBox(height: 33.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: AppStrings.dontHaveAnAccount,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteDarker,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.chooseScreen);
                      },
                      child: const CustomText(
                        left: 8,
                        text: AppStrings.createAccount,
                        color: AppColors.blackNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
