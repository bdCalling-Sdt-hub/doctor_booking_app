import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_delete_account_diologe_box/custom_delete_dialoge_account_box.dart';
import 'package:doctor_booking/view/widgets/custom_profile_card/custom_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///======================Setting Appbar==================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.settings,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ///========================Change Password===================
            CustomProfileCard(
                isBorder: true,
                text: AppStrings.changePassword,
                leadingIcon: AppIcons.key,
                onTap: () {
                  Get.toNamed(AppRoutes.changePasswordScreen);
                },
                isCevron: true),

            ///========================Delete Account===================
            CustomProfileCard(
                isBorder: true,
                text: AppStrings.deleteAccount,
                leadingIcon: AppIcons.frame,
                onTap: () {
                  showDialogBox(
                      context, profileController.retypePasswordController);
                },
                isCevron: false),
          ],
        ),
      ),
    );
  }

  void openDialog(context) {
    showDialogBox(context, profileController.retypePasswordController);
  }
}
