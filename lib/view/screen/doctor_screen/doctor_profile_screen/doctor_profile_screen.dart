import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      ///================== AppBar ============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.profile,
      ),
      //=================== body ==============//
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              CustomNetworkImage(
                imageUrl: AppConstants.userNtr,
                height: 90.h,
                width: 90.w,
                boxShape: BoxShape.circle,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.personalInfo,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarker,
                        ),
                        // ================= personal info screen button ==========//
                        InkWell(
                          onTap: () {
                            Get.toNamed(
                                AppRoutes.doctorEditPersonalProfileScreen);
                          },
                          child: const CustomImage(
                            imageSrc: AppIcons.edit,
                            imageType: ImageType.png,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Container(
                        width: 335.w,
                        height: 2,
                        color: AppColors.whiteNormalHover,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // ============== doctor name ===============//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.yourName,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'Dr. Hassan',
                    ),
                    //============== doctor date of birth =============\\
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.dateOfBirth,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '05-12-2001',
                    ),
                    //============ doctor email ==============//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.email,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'info@gmail.com',
                    ),
                    //============ doctor phnoe number ===========//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.phoneNumber,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '(00)+5452 125 36',
                    ),

                    ///=============== doctor loaction ============//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.location,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '775 Rolling Green Rd.',
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    //===========professional info ==========//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.professionalInfo,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarker,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(
                                AppRoutes.doctorEditProfessinalProfileScreen);
                          },
                          child: const CustomImage(
                            imageSrc: AppIcons.edit,
                            imageType: ImageType.png,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Container(
                        width: 335.w,
                        height: 2,
                        color: AppColors.whiteNormalHover,
                      ),
                    ),
                    //=============== doctor medical licence image =============//
                    CustomText(
                      top: 8.h,
                      bottom: 8.h,
                      text: AppStrings.medicalLicenceImage,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteDarker,
                    ),

                    CustomNetworkImage(
                      imageUrl: AppConstants.medicalLicence,
                      height: 120.h,
                      width: 335.w,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    //============ doctor specilization ============//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.specialization,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'Cardiologist.',
                    ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.yearsOfExperience,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '4 years',
                    ),

                    ///============================= Education Background ===============================

                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.educationalBackground,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'type here',
                    ),
                    //================= doctor currentAffiliation =============//
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.currentAffiliation,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'hospital clinic name',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const DoctorNavBar(currentIndex: 4),
    );
  }
}
