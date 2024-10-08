import 'dart:io';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  ProfessionalInfoScreen({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();
  final GeneralController genarelController = Get.find<GeneralController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Obx(() {
          return Form(
            key: formKey,
            child: Column(
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
                //=========================== Appointment Licence no ========================//
                CustomFormCard(
                  hintText: 'Enter your license no',
                  hasBackgroundColor: true,
                  title: 'License No',
                  controller: doctorAuthController.licenceNoController.value,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),
                // //=========================== Appointment fee ========================//
                // CustomFormCard(
                //   hintText: 'Enter your fee',
                //   hasBackgroundColor: true,
                //   title: 'Appointment Fee',
                //   controller:
                //       doctorAuthController.appointmentFeeController.value,
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.toString().isEmpty) {
                //       return AppStrings.fieldCantBeEmpty;
                //     } else if (double.parse(value) <= 49) {
                //       return 'Minimum fee is 50';
                //     }
                //     return null;
                //   },
                // ),

                // /==================================specialization==========================
                CustomFormCard(
                  hasBackgroundColor: true,
                  title: 'Specialisation',
                  controller: doctorAuthController.specialisController.value,
                  readOnly: true,
                  suffixIcon: CustomPopupmenuButton(
                    onChanged: (value) {
                      doctorAuthController.specialisController.value.text =
                          value;
                    },
                    items: genarelController.categoryListName,
                    icons: Icons.keyboard_arrow_down,
                  ),
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),

                //============================= Discription ================
                CustomFormCard(
                  hasBackgroundColor: true,
                  title: 'Professional Discription',
                  controller: doctorAuthController
                      .professionalDiscriptionController.value,
                  hintText: 'Enter discription',
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),

                ///==================================yearsOfExperience==========================
                CustomFormCard(
                  hasBackgroundColor: true,
                  title: AppStrings.yearsOfExperience,
                  controller: doctorAuthController.experienceController.value,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),

                ///==================================Educational Background==========================
                CustomFormCard(
                  hasBackgroundColor: true,
                  title: AppStrings.educationalBackground,
                  controller: doctorAuthController.educationController.value,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),

                ///==================================currentAffiliation==========================
                CustomFormCard(
                  hasBackgroundColor: true,
                  title: AppStrings.currentAffiliation,
                  controller: doctorAuthController.affiliationController.value,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),

                ///==============Checkbox============
                // Row(
                //   children: [
                //     Checkbox(
                //       value: doctorAuthController.isRemember.value,
                //       checkColor: AppColors.blackNormal,
                //       activeColor: AppColors.white,
                //       onChanged: (value) {
                //         doctorAuthController.toggleRemember();
                //       },
                //     ),
                //     Expanded(
                //       child: RichText(
                //         maxLines: 4,
                //         text: TextSpan(
                //           children: <TextSpan>[
                //             const TextSpan(
                //               text: AppStrings.byContinueYouAccept,
                //               style: TextStyle(
                //                 color: AppColors.blackNormal,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 12,
                //               ),
                //             ),

                //             ///==========================Terms of use=======================
                //             TextSpan(
                //               text: "\n${AppStrings.termsAndConditions}  ",
                //               style: const TextStyle(
                //                 color: AppColors.blackNormal,
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //               recognizer: TapGestureRecognizer()
                //                 ..onTap = () {
                //                   Get.toNamed(
                //                       AppRoutes.termsAndConditionScreen);
                //                 },
                //             ),
                //             const TextSpan(
                //               text: "${AppStrings.and}  ",
                //               style: TextStyle(
                //                 color: AppColors.blackNormal,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 12,
                //               ),
                //             ),

                //             ///==============================Privacy policy====================
                //             TextSpan(
                //               text: AppStrings.privacyPolicy,
                //               style: const TextStyle(
                //                 color: AppColors.blackNormal,
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //               recognizer: TapGestureRecognizer()
                //                 ..onTap = () {
                //                   Get.toNamed(AppRoutes.privacyPolicyScreen);
                //                 },
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                // SizedBox(
                //   height: 10.h,
                // ),

                ///================================Next button====================
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      doctorAuthController.updateStep(3);
                    }
                  },
                  title: AppStrings.next,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
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
