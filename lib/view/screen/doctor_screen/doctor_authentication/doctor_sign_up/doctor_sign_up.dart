import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/appointment_info_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/personal_info_screen/personal_info_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/professional_info_screen/professional_info_screen.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';

class DoctorSignUp extends StatelessWidget {
  DoctorSignUp({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,

      ///====================Set your profile appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.whiteNormal,
        title: const CustomText(
          text: AppStrings.signUp,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.grayNormal,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackNormal,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => EasyStepper(
                lineStyle: const LineStyle(
                    defaultLineColor: AppColors.whiteDarkHover,
                    lineType: LineType.normal),
                activeStep: doctorAuthController.currentStep.value,
                stepShape: StepShape.circle,
                stepBorderRadius: 15.r,
                borderThickness: 5,
                stepRadius: 28.r,
                activeStepBorderColor: AppColors.grayLightHover,
                activeStepBackgroundColor: AppColors.blackNormal,
                finishedStepBackgroundColor: Colors.white,
                finishedStepBorderColor: AppColors.grayLightHover,
                unreachedStepBackgroundColor: Colors.white,
                unreachedStepBorderColor: AppColors.grayLightHover,
                steps: const [
                  EasyStep(
                    customStep: CustomText(
                      text: '1',
                      maxLines: 2,
                    ),
                    title: 'Personal \n  Info',
                  ),
                  EasyStep(
                    customStep: CustomText(text: '2'),
                    title: 'Appointment  \n Info',
                  ),
                  EasyStep(
                    customStep: CustomText(text: '3'),
                    title: 'Professional  \n Info',
                  ),
                ],
                onStepReached: (index) {
                  doctorAuthController.updateStep(index);
                },
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                switch (doctorAuthController.currentStep.value) {
                  case 0:
                    return PersonalInfoScreen();
                  case 1:
                    return AppointmentInfoScreen();
                  case 2:
                    return ProfessionalInfoScreen();
                  default:
                    return PersonalInfoScreen();
                }
              }),
            ),
            SizedBox(
              height: 24.h,
            )
          ],
        ),
      ),
    );
  }
}
