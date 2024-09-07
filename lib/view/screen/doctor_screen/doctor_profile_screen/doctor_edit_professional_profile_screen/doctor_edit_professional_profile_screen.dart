import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_edit_professional_profile_screen/inner_widget/doctor_edit_license.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorEditProfessionalProfileScreen extends StatelessWidget {
  DoctorEditProfessionalProfileScreen({super.key});
  final GeneralController generalController = Get.find<GeneralController>();
  final DoctorProfileController doctorProfileController =
      Get.find<DoctorProfileController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      //================== app bar ===============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.editProfessinalInformation,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      //===================== doctor medical image ================//
                      CustomText(
                        top: 8.h,
                        bottom: 8.h,
                        text: AppStrings.medicalLicenceImage,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteDarker,
                      ),

                      // CustomNetworkImage(
                      //   imageUrl: AppConstants.medicalLicence,
                      //   height: 160.h,
                      //   width: 335.w,
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      doctorProfileController.licenseImage.value == null
                          ? DoctorEditLicenseNetworkImage(
                              imageSrc: doctorProfileController
                                      .profileModel.value.license!
                                      .startsWith('http')
                                  ? doctorProfileController
                                          .profileModel.value.license ??
                                      ''
                                  : "${ApiUrl.imageBaseUrl}${doctorProfileController.profileModel.value.license}",
                              onTap: () {
                                doctorProfileController.getDoctorLicenseImage();
                              },
                            )
                          : DoctorEditLicenseFileImage(
                              imageSrc: doctorProfileController
                                  .licenseImage.value!.path,
                              onTap: () {
                                doctorProfileController.getDoctorLicenseImage();
                              },
                            ),
                      SizedBox(
                        height: 8.h,
                      ),
                      //============ doctor specilization ============//
                      // CustomFormCard(
                      //   hasBackgroundColor: true,
                      //   title: AppStrings.specialization,
                      //   controller: doctorProfileController
                      //       .doctorSpecializationController.value,
                      //   hintTextChangeColor: true,
                      //   hintText: 'Cardiologist.',
                      //   validator: (value) {
                      //     if (value == null || value.toString().isEmpty) {
                      //       return AppStrings.fieldCantBeEmpty.tr;
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: 'Specialisation',
                        controller: doctorProfileController
                            .doctorSpecializationController.value,
                        readOnly: true,
                        suffixIcon: CustomPopupmenuButton(
                          onChanged: (value) {
                            doctorProfileController
                                .doctorSpecializationController
                                .value
                                .text = value;
                          },
                          items: generalController.categoryListName,
                          icons: Icons.keyboard_arrow_down,
                        ),
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.yearsOfExperience,
                        controller: doctorProfileController
                            .doctorYearOfExperienceController.value,
                        hintTextChangeColor: true,
                        hintText: '4 years',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),

                      ///============================= Education Background ===============================

                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.educationalBackground,
                        controller: doctorProfileController
                            .doctorEducationalBackgroundController.value,
                        hintTextChangeColor: true,
                        hintText: 'type here',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      //================= doctor currentAffiliation =============//
                      CustomFormCard(
                        hasBackgroundColor: true,
                        title: AppStrings.currentAffiliation,
                        controller: doctorProfileController
                            .doctorCurrentAlliliationController.value,
                        hintTextChangeColor: true,
                        hintText: 'hospital clinic name',
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return AppStrings.fieldCantBeEmpty.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //================ update button =============//
                      CustomButton(
                        title: AppStrings.update,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            doctorProfileController
                                .updateDoctorProfessionalProfile();
                          }
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
