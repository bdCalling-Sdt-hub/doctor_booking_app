import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpDoctorOtpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpDoctorOtpScreen({super.key});

  // final String email = Get.arguments;
  final DoctorAuthController authController = Get.find<DoctorAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteLightActive,
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.verification,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
        child: Column(
          children: [
            ///=================================Title Text=====================================>
            const Center(
              child: CustomText(
                text: AppStrings.checkYourEmail,
                fontSize: 18,
                color: AppColors.grayNormal,
                fontWeight: FontWeight.w500,
              ),
            ),
            const CustomText(
              text: AppStrings.weSentAResetLinkTO,
              fontWeight: FontWeight.w400,
              maxLines: 3,
              top: 8,
              fontSize: 12,
            ),
            SizedBox(height: 44.h),

            ///======================================Pin Code Field============================>
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Enter Code',
                fontSize: 16.h,
                fontWeight: FontWeight.w500,
                bottom: 16.h,
              ),
            ),
            Obx(() {
              return PinCodeTextField(
                cursorColor: AppColors.bluNormalHover,
                keyboardType: TextInputType.number,
                enablePinAutofill: true,
                appContext: context,
                onCompleted: (value) {
                  // controller.otp.value = value;
                  // controller.otp.refresh();
                },
                autoFocus: true,
                textStyle: TextStyle(
                  color: AppColors.blackO,
                  fontSize: 24.h,
                ),
                pinTheme: PinTheme(
                  disabledColor: Colors.transparent,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 56.h,
                  fieldWidth: 47.w,
                  activeFillColor: AppColors.whiteNormal,
                  selectedFillColor: AppColors.whiteNormal,
                  inactiveFillColor: AppColors.whiteNormal,
                  borderWidth: 0.5,
                  errorBorderColor: AppColors.whiteDarker,
                  activeBorderWidth: 0.8,
                  selectedColor: AppColors.whiteDarker,
                  inactiveColor: AppColors.blackLight,
                  activeColor: AppColors.whiteDarker,
                ),
                controller: authController.verifyCodeController.value,
                length: 6,
                enableActiveFill: true,
              );
            }),
            SizedBox(height: 16.h),

            ///==============================Resend Button=============================>
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // Implement resend OTP functionality here
                },
                child: const CustomText(
                  text: "Resend OTP",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.bluNormalHover,
                ),
              ),
            ),
            SizedBox(height: 62.h),

            ///==================================Verify Button===========================>
            CustomButton(
              onTap: () {
                if (authController.verifyCodeController.value.text.isNotEmpty) {
                  authController.varifyEmail();
                }
              },
              title: AppStrings.verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
