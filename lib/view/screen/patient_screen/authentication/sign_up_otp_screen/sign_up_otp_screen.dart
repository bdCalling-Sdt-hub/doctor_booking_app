import 'dart:async';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({super.key});

  @override
  State<SignUpOtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<SignUpOtpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  int _secondsRemaining = 120;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    pinController.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

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
            PinCodeTextField(
              cursorColor: AppColors.bluNormalHover,
              keyboardType: TextInputType.number,
              controller: pinController,
              enablePinAutofill: true,
              appContext: context,
              onCompleted: (value) {
                // Handle OTP completion here
                // For example, save the OTP value to a controller
                // doctorAuthController.otpCode = value;
                setState(() {}); // Trigger UI update if necessary
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
              length: 4,
              enableActiveFill: true,
            ),
            SizedBox(height: 16.h),

            ///==============================Resend Button=============================>
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // if (_secondsRemaining == 0) {
                  //   _secondsRemaining = 120;
                  //   startTimer();
                  //   // Implement OTP resend logic here
                  // }
                },
                child: const CustomText(
                  text: AppStrings.resendOtp,
                  // text: _secondsRemaining == 0
                  //     ? AppStrings.resendOtp
                  //     : "Resend SMS $_secondsRemaining",
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
                // if (formKey.currentState?.validate() ?? false) {
                //   // Validate OTP and navigate to the next screen
                // }
                Get.toNamed(AppRoutes.signInScreen);

              },
              title: AppStrings.verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
