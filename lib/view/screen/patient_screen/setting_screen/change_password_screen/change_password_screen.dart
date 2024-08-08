import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///==================ChangePassword Appbar===============
      appBar: const CustomAppBar(
        appBarContent: AppStrings.changePassword,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.setYourNewPassword.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.grayNormal,
                bottom: 10,
              ),

              ///==========================EnterCurrentPassword==============

              CustomFormCard(

                  title: AppStrings.enterCurrentPassword,
                  controller: TextEditingController()),

              ///==========================enterNewPassword==============

              CustomFormCard(
                  title: AppStrings.enterNewPassword,
                  controller: TextEditingController()),

              ///==========================retypeNewPassword==============

              CustomFormCard(
                  title: AppStrings.retypeNewPassword,
                  controller: TextEditingController()),

              SizedBox(
                height: 45.h,
              ),

              ///==========================changePassword==============
              CustomButton(
                onTap: () {
                  Get.back();
                },
                title: AppStrings.changePassword.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
