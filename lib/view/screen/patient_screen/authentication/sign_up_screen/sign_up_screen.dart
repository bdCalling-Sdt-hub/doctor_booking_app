import 'package:doctor_booking/controller/patient_auth_controller/patient_auth_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final PatientAuthController patientAuthController =
      Get.find<PatientAuthController>();
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ///===============================Your Name Here=====================
                CustomFormCard(
                  hintText: AppStrings.yourNameHere,
                  title: AppStrings.yourName,
                  controller: patientAuthController.patientNameController,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 4) {
                      return AppStrings.enterAValidName.tr;
                    }
                    return null;
                  },
                ),

                ///===============================dateOfBirth=====================
                CustomFormCard(
                  onTap: () async {
                    await patientAuthController.getPatientDateOfBirth();
                  },
                  readOnly: true,
                  hintText: 'dd/mm/yy',
                  title: AppStrings.dateOfBirth,
                  controller:
                      patientAuthController.patientDateOfBirthController.value,
                  hasSuffixIcon: true,
                  validator: (value) {
                    if (value == null) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    }
                    return null;
                  },
                ),

                ///===============================Email=====================
                CustomFormCard(
                    hintText: AppStrings.yourMailHere,
                    title: AppStrings.email,
                    controller:
                        patientAuthController.patientEmailController.value),

                ///===============================Phone number=====================
                CustomFormCard(
                    hintText: AppStrings.yourPhoneNumberHere,
                    title: AppStrings.phoneNumber,
                    controller: patientAuthController
                        .patientPhoneNumberController.value),

                ///===============================Location=====================
                CustomFormCard(
                    hintText: AppStrings.typeYourLocationHere,
                    title: AppStrings.location,
                    controller:
                        patientAuthController.patientLoactionController.value),

                ///===============================Password=====================
                CustomFormCard(
                    hintText: AppStrings.enterPassword,
                    title: AppStrings.password,
                    controller:
                        patientAuthController.patientPasswordController.value),

                ///===============================confirmPassword=====================
                CustomFormCard(
                    hintText: AppStrings.enterPassword,
                    title: AppStrings.confirmPassword,
                    controller: patientAuthController
                        .patientConfirmPasswordController.value),

                ///==========================Continue Button=========================

                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      patientAuthController.signUpUser();
                    }
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
                      onTap: () {
                        Get.toNamed(AppRoutes.signInScreen);
                      },
                      child: const CustomText(
                        left: 8,
                        text: AppStrings.signIn,
                        color: AppColors.bluNormalHover,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
