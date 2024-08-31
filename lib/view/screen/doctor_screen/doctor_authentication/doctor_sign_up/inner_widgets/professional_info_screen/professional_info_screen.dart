import 'dart:io';

import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  ProfessionalInfoScreen({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///============= medicalLicenceImage image =========
              _buildImageSection(
                title: AppStrings.medicalLicenceImage,
                image: doctorAuthController.documentImage,
                onSelectImage: () => doctorAuthController.documentImages(),
              ),
              SizedBox(
                height: 10.h,
              ),
              //=========================== Appointment fee ========================//
              CustomFormCard(
                hintText: 'Enter your fee',
                hasBackgroundColor: true,
                title: 'Appointment Fee',
                controller: doctorAuthController.appointmentFeeController.value,
              ),

              ///==================================specialization==========================
              CustomFormCard(
                hasBackgroundColor: true,
                title: 'Specialisation',
                controller: doctorAuthController.specialisController.value,
              ),
              //============================= Discription ================
              CustomFormCard(
                hasBackgroundColor: true,
                title: 'Professional Discription',
                controller: TextEditingController(),
                hintText: 'Enter discription',
              ),

              ///==================================yearsOfExperience==========================
              CustomFormCard(
                hasBackgroundColor: true,
                title: AppStrings.yearsOfExperience,
                controller: doctorAuthController.experienceController.value,
              ),

              ///==================================Educational Background==========================
              CustomFormCard(
                  hasBackgroundColor: true,
                  title: AppStrings.educationalBackground,
                  controller: doctorAuthController.educationController.value),

              ///==================================currentAffiliation==========================
              CustomFormCard(
                  hasBackgroundColor: true,
                  title: AppStrings.currentAffiliation,
                  controller: doctorAuthController.affiliationController.value),

              ///==============Checkbox============
              Row(
                children: [
                  Checkbox(
                    value: doctorAuthController.isRemember.value,
                    checkColor: AppColors.blackNormal,
                    activeColor: AppColors.white,
                    onChanged: (value) {
                      doctorAuthController.toggleRemember();
                    },
                  ),
                  Expanded(
                    child: RichText(
                      maxLines: 4,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: AppStrings.byContinueYouAccept,
                            style: TextStyle(
                              color: AppColors.blackNormal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),

                          ///==========================Terms of use=======================
                          TextSpan(
                            text: "\n${AppStrings.termsAndConditions}  ",
                            style: const TextStyle(
                              color: AppColors.blackNormal,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.termsAndConditionScreen);
                              },
                          ),
                          const TextSpan(
                            text: "${AppStrings.and}  ",
                            style: TextStyle(
                              color: AppColors.blackNormal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),

                          ///==============================Privacy policy====================
                          TextSpan(
                            text: AppStrings.privacyPolicy,
                            style: const TextStyle(
                              color: AppColors.blackNormal,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.privacyPolicyScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              ///================================= Sign up Button ============================

              CustomButton(
                onTap: () {
                  // Get.toNamed(AppRoutes.doctorHomeScreen);

                  doctorAuthController.doctorSignUp();
                },
                title: AppStrings.signUp,
              ),
              SizedBox(
                height: 10.h,
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
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildImageSection({
    required String title,
    required RxString image,
    required VoidCallback onSelectImage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          bottom: 10.h,
        ),
        GestureDetector(
          onTap: onSelectImage,
          child: image.isNotEmpty
              ? Container(
                  height: 144.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: FileImage(File(image.value)),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 144,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImage(
                          imageSrc: AppIcons.gallery,
                          imageType: ImageType.svg,
                          size: 30.sp,
                        ),
                        CustomText(
                          text: AppStrings.uploadPhoto,
                          fontSize: 14.h,
                          color: AppColors.whiteDarkHover,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
