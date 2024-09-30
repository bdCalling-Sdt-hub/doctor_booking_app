import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:doctor_booking/view/widgets/custom_radio_button/custom_radio_button.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseScreen extends StatelessWidget {
  final PaitentHomeController _controller = Get.find<PaitentHomeController>();

  ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteNormal,
      ),
      backgroundColor: AppColors.whiteNormal,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const CustomImage(
                imageSrc: AppImages.ilera,
                imageType: ImageType.png,
              ),
              const CustomText(
                top: 50,
                bottom: 98,
                text: AppStrings.choseYourRole,
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColors.grayNormal,
              ),
              CustomRadioButton(
                value: 'Patient',
                groupValue: _controller.selectedOption,
                onChanged: (value) {
                  _controller.setSelectedOption(value!);
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomRadioButton(
                value: 'Health Professional',
                groupValue: _controller.selectedOption,
                onChanged: (value) {
                  _controller.setSelectedOption(value!);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///======================== Agreement Check =======================

                  Checkbox(
                      activeColor: AppColors.blackDarker,
                      value: _controller.isAgree.value,
                      onChanged: (value) {
                        _controller.isAgree.value = value ?? false;
                      }),

                  Expanded(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: AppStrings.byRegistering,
                            style: TextStyle(
                              color: AppColors.whiteDarkActive,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " ${AppStrings.termsOfUse}",
                            style: const TextStyle(
                                color: AppColors.blackDarker,
                                fontWeight: FontWeight.w500),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.termsAndConditionScreen);
                              },
                          ),
                          const TextSpan(
                            text: " and ",
                            style: TextStyle(
                              color: AppColors.whiteDarkActive,
                              //
                            ),
                          ),
                          TextSpan(
                            text: "${AppStrings.privacyPolicy}.",
                            style: const TextStyle(
                                color: AppColors.blackDarker,
                                fontWeight: FontWeight.w500),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.privacyPolicyScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                title: AppStrings.continues,
                onTap: () {
                  if (!_controller.isAgree.value) {
                    return toastMessage(
                        message: "Please agree with the terms and privacy");
                  }
                  if (_controller.selectedOption == 'Patient') {
                    Get.toNamed(AppRoutes.signUpScreen);
                  } else if (_controller.selectedOption ==
                      'Health Professional') {
                    Get.toNamed(AppRoutes.doctorSignUp);
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
