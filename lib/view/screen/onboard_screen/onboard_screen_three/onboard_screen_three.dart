import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardScreenThree extends StatelessWidget {
  OnboardScreenThree({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomImage(
            imageSrc: AppImages.onBoardThree,
            imageType: ImageType.png,
            //  fit: BoxFit.cover,
            fit: BoxFit.fitWidth,
          ),

          // Container(
          //   // height: double.maxFinite,
          //   //  width: double.maxFinite,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.cover,
          //           image: AssetImage(
          //             AppImages.onBoardThree,
          //           ))),
          // ),

          ///===========================Next Button==============
          SizedBox(
            height: 24.h,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomText(
                  text: AppStrings.yourHealthRecords,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackO,
                  bottom: 8,
                  maxLines: 2,
                ),
                const CustomText(
                  text: AppStrings.securelyAccessYourMedical,
                  fontSize: 14,
                  maxLines: 5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkActive,
                  bottom: 24,
                ),
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.signInScreen);
                  },
                  title: AppStrings.getStart,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.grayLightHover,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.grayLightHover,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const CircleAvatar(
                      radius: 7,
                      backgroundColor: AppColors.blackNormal,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
