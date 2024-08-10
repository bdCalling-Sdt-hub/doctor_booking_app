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

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      ///==================AppBar============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.profile,
      ),
      //===================body==============//
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Stack(
                children: [
                  CustomNetworkImage(
                    imageUrl: AppConstants.userNtr,
                    height: 80.h,
                    width: 80.w,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 17,
                        backgroundColor: AppColors.blackNormal,
                        child: Center(
                          child: CustomImage(
                            imageSrc: AppIcons.photoCamera,
                            sizeWidth: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
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
                        InkWell(
                          onTap: () {},
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
                    // CustomText(
                    //   text: AppStrings.yourName,
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w400,
                    //   color: AppColors.whiteDarker,
                    //   bottom: 12,
                    // ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.yourName,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'Dr. Hassan',
                    ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.dateOfBirth,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '05-12-2001',
                    ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.email,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'info@gmail.com',
                    ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.phoneNumber,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '(00)+5452 125 36',
                    ),
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.location,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: '775 Rolling Green Rd.',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.personalInfo,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarker,
                        ),
                        InkWell(
                          onTap: () {},
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

                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: AppStrings.medicalLicenceImage,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteDarker,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomNetworkImage(
                      imageUrl: AppConstants.medicalLicence,
                      height: 120.h,
                      width: 335.w,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
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
                    CustomFormCard(
                      hasBackgroundColor: true,
                      title: AppStrings.educationalBackground,
                      controller: TextEditingController(),
                      hintTextChangeColor: true,
                      readOnly: true,
                      hintText: 'type here',
                    ),
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
      bottomNavigationBar: DoctorNavBar(currentIndex: 4),
    );
  }
}
