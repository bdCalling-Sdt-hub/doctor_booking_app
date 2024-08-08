import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_profile_card/custom_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      ///======================Setting Appbar==================
      appBar: const CustomAppBar(appBarContent: AppStrings.settings,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ///========================Change Password===================
            CustomProfileCard(
               isBorder: true,
                text: AppStrings.changePassword,
                leadingIcon: AppIcons.key,
                onTap: (){
                 Get.toNamed(AppRoutes.changePasswordScreen);
                },
                isCevron: true),

            ///========================Delete Account===================
            CustomProfileCard(
               isBorder: true,
                text: AppStrings.deleteAccount,
                leadingIcon: AppIcons.frame,
                onTap: (){},
                isCevron: false),
          ],
        ),
      ),
    );
  }
}
