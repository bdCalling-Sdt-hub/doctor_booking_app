import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      bottomNavigationBar: const PatientNavBar(currentIndex: 2),
      appBar: const CustomAppBar(appBarContent: AppStrings.location),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomImage(
                imageSrc: AppImages.accessLocation,
                imageType: ImageType.png,
              ),
              const CustomText(
                text: AppStrings.allowLocationAccess,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.grayNormal,
              ),
              const CustomText(
                left: 15,
                right: 15,
                text: AppStrings.weUseThisToShowNearbyHospitals,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarker,
                maxLines: 2,
              ),
              SizedBox(
                height: 231.h,
              ),
              const CustomText(
                text: AppStrings.byAllowingAccessYouConsentTo,
                fontSize: 12,
                left: 15,
                right: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarker,
                maxLines: 2,
              ),
              SizedBox(
                height: 24.h,
              ),

              ///=========================Allow Access Button===================
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.hospitalScreen);
                },
                title: AppStrings.allowAccess,
              )
            ],
          ),
        ),
      ),
    );
  }
}
