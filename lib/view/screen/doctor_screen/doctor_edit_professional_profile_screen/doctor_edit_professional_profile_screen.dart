import 'package:doctor_booking/global/general_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_personal_profile_screen/inner_widget.dart/doctor_edit_profile_image.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorEditProfessionalProfileScreen extends StatelessWidget {
  DoctorEditProfessionalProfileScreen({super.key});
  final GeneralController generalController = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      //================== app bar ===============//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.editProfessinalInformation,
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
                  generalController.showPopUpLoader();
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    textAlign: TextAlign.start,
                    text: AppStrings.professionalInfo,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 16.h,
                  ),
                  //===================== doctor medical image ================//
                  CustomText(
                    top: 8.h,
                    bottom: 8.h,
                    text: AppStrings.medicalLicenceImage,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteDarker,
                  ),

                  CustomNetworkImage(
                    imageUrl: AppConstants.medicalLicence,
                    height: 120.h,
                    width: 335.w,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //============ doctor specilization ============//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.specialization,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: 'Cardiologist.',
                  ),
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.yearsOfExperience,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: '4 years',
                  ),

                  ///============================= Education Background ===============================

                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.educationalBackground,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: 'type here',
                  ),
                  //================= doctor currentAffiliation =============//
                  CustomFormCard(
                    hasBackgroundColor: true,
                    title: AppStrings.currentAffiliation,
                    controller: TextEditingController(),
                    hintTextChangeColor: true,
                    hintText: 'hospital clinic name',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //================ update button =============//
                  CustomButton(
                    title: AppStrings.update,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
