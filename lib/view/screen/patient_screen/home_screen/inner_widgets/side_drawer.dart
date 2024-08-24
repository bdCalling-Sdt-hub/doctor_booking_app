import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
        color: AppColors.whiteLightActive,
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          ///================================ APP LOGO ==============================///
          Container(
            height: 122,
            color: AppColors.blackO,
            child: const CustomImage(
              imageSrc: AppImages.logo,
              imageType: ImageType.png,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    ///====================== Call History======================>
                    customRow(
                        title: AppStrings.appointmentHistory,
                        icon: AppIcons.appointmentSelected,
                        onTap: () {
                          Get.toNamed(AppRoutes.callHistoryScreen);
                        }),

                    ///====================== termsAndConditions======================>
                    customRow(
                        title: AppStrings.termsAndConditions,
                        icon: AppIcons.terms,
                        onTap: () {
                          Get.toNamed(AppRoutes.termsAndConditionScreen);
                        }),

                    ///====================== privacyPolicy======================>
                    customRow(
                        title: AppStrings.privacyPolicy,
                        icon: AppIcons.policy,
                        onTap: () {
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        }),

                    ///====================== settings======================>
                    customRow(
                        title: AppStrings.settings,
                        icon: AppIcons.setting,
                        onTap: () {
                          Get.toNamed(AppRoutes.settingScreen);
                        }),
                    SizedBox(height: 200.h,),
                    ///====================== Log Out======================>
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.signInScreen);
                      },
                      child: Row(
                        children: [
                          const CustomImage(
                            imageSrc: AppIcons.logOut,
                            imageType: ImageType.svg,
                            imageColor: AppColors.whiteDarker,
                          ),
                          CustomText(
                            color: AppColors.whiteDarker,
                            left: 16.w,
                            text: AppStrings.logOut,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customRow(
          {required String title,
          required String icon,
          required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomImage(
                      imageSrc: icon,
                      imageType: ImageType.svg,
                      imageColor: AppColors.whiteDarker,
                    ),
                    CustomText(
                      color: AppColors.whiteDarker,
                      left: 16.w,
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Divider()
              ],
            )),
      );
}
