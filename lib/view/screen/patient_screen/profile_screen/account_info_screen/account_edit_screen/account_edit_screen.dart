import 'dart:io';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountEditScreen extends StatelessWidget {
  AccountEditScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const PatientNavBar(currentIndex: 4),
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.editAccountInfo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: AppStrings.uploadPhoto,
                  color: AppColors.grayNormal,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),

                ///=====================Image Upload============
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {
                        profileController.selectImage();
                      },
                      child: profileController.imageFile.value.path.isNotEmpty
                          ? Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(profileController.image.value),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle),
                            )
                          : Stack(
                              children: [
                                CustomNetworkImage(
                                  boxShape: BoxShape.circle,
                                  imageUrl: profileController.image.value,
                                  height: 100.h,
                                  width: 100.w,
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                            color: AppColors.eyeColor,
                                            shape: BoxShape.circle),
                                        child: const Icon(Icons.photo)
                                        // const CustomImage(
                                        //     imageSrc: AppIcons.photoCamera),

                                        ))
                              ],
                            )),
                ),

                ///=====================Full Name ================
                CustomFormCard(
                    title: AppStrings.fullName,
                    controller: profileController.fullNameController.value),

                ///=====================Email ================
                CustomFormCard(
                    title: AppStrings.email,
                    controller: profileController.emailController.value),

                ///=====================Phone Number ================
                CustomFormCard(
                    title: AppStrings.phoneNumber,
                    controller: profileController.phoneNumberController.value),

                ///=====================Date Of Birth================
                CustomFormCard(
                    title: AppStrings.dateOfBirth,
                    controller: profileController.dateOfBirthController.value),

                ///=====================Location================
                CustomFormCard(
                    title: AppStrings.gender,
                    controller: profileController.ganderController.value),

                ///===================Update Button===========
                CustomButton(
                  title: AppStrings.update,
                  onTap: () {
                    profileController.editProfile();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
