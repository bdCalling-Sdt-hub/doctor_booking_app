import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_personal_profile_screen/inner_widget.dart/doctor_edit_profile_image.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorEditPersonalProfileScreen extends StatelessWidget {
  DoctorEditPersonalProfileScreen({super.key});

  final GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      /// =================== appbar ===============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.editPersonalInformation,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            ////============== Profile image ===========///
            Center(
              child: DoctorEditProfileImage(
                imageSrc: AppConstants.userNtr,
                onTap: () {
                  generalController.popupCameraOrGallery();
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //============== personal info =============//
                  const CustomText(
                    textAlign: TextAlign.start,
                    text: AppStrings.personalInfo,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 16.h,
                  ),

                  /// ============== doctor name ==========//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.yourName,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: 'Dr. Hassan',
                  ),
                  //=============== doctor date of birth =========//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.dateOfBirth,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: '05-12-2001',
                  ),
                  // ================ doctor email ============//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.email,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: 'info@gmail.com',
                  ),

                  /// ================== doctor phone number ==========//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.phoneNumber,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: '(00)+5452 125 36',
                  ),

                  /// ============== doctor loactions ==================//

                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.location,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: '775 Rolling Green Rd.',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //================ update button =============//
                  CustomButton(
                    title: AppStrings.update,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
