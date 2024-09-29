import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_profile_card/custom_profile_card.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///===========================Profile Appbar==================
      appBar: const CustomAppBar(
        showBackButton: false,
        appBarContent: AppStrings.profile,
      ),
      bottomNavigationBar: const PatientNavBar(currentIndex: 4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ///=======================Account Info==============
            CustomProfileCard(
                text: AppStrings.accountInfo,
                leadingIcon: AppIcons.person,
                onTap: () {
                  Get.toNamed(AppRoutes.accountInfoScreen);
                },
                isCevron: true),

            ///=======================Appointment History==============
            CustomProfileCard(
                text: AppStrings.appointmentHistory,
                leadingIcon: AppIcons.history,
                onTap: () {
                  Get.toNamed(AppRoutes.appointmentHistoryScreen);
                },
                isCevron: true),

            // ///=======================paymentOption==============

            // CustomProfileCard(
            //     text: AppStrings.paymentOption,
            //     leadingIcon: AppIcons.addCard,
            //     onTap: () {},
            //
            //
            //   isCevron: true),

            ///======================= Update Interest =============

            CustomProfileCard(
                text: AppStrings.updateInterest,
                leadingIcon: AppIcons.northEast,
                onTap: () {
                  Get.toNamed(AppRoutes.selectInterest,
                      arguments: true);
                },
                isCevron: true),

            ///=======================helpCenter==============

            CustomProfileCard(
                text: AppStrings.helpCenter,
                leadingIcon: AppIcons.help,
                onTap: () {
                  Get.toNamed(AppRoutes.helpCenterScreen);
                },
                isCevron: true),

            ///=======================Log Out==============

            CustomProfileCard(
                text: AppStrings.logOut,
                leadingIcon: AppIcons.logOut,
                onTap: () {
                  profileController.logOut();
                },
                isCevron: true),
          ],
        ),
      ),
    );
  }
}
