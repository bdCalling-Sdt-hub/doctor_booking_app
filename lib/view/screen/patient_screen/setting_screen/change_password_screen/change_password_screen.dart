import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final ProfileController profileController = Get.find<ProfileController>();

  final formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
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
                  controller: profileController.currentPassController.value,
                  isPassword: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 7 &&
                        !AppStrings.passRegexp.hasMatch(value)) {
                      return AppStrings.passwordMustHaveEightWith.tr;
                    } else {
                      return null;
                    }
                  },
                ),

                ///==========================enterNewPassword==============

                CustomFormCard(
                  title: AppStrings.enterNewPassword,
                  controller: profileController.newPassController.value,
                  isPassword: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 8 &&
                        !AppStrings.passRegexp.hasMatch(value)) {
                      return AppStrings.passwordMustHaveEightWith.tr;
                    } else {
                      return null;
                    }
                  },
                ),

                ///==========================retypeNewPassword==============

                CustomFormCard(
                  title: AppStrings.retypeNewPassword,
                  controller: profileController.reTypeNewPassController.value,
                  isPassword: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 8 &&
                        !AppStrings.passRegexp.hasMatch(value)) {
                      return AppStrings.passwordMustHaveEightWith.tr;
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(
                  height: 45.h,
                ),

                ///==========================changePassword==============
                Obx(() {
                  return profileController.loading.value
                      ? const CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              profileController.changePassword();
                            }
                          },
                          title: AppStrings.changePassword.tr,
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
