import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///==============================Your Name ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourNameHere,
                title: AppStrings.yourName,
                controller: doctorAuthController.doctorNameController.value),

            ///==============================Date of birth ======================
            CustomFormCard(
                readOnly: true,
                onTap: () async {
                  final DateTime? pickDate = await showDatePicker(
                      context: Get.context!,
                      firstDate: DateTime(1970),
                      lastDate: DateTime.now());

                  if (pickDate != null) {
                    final formatDate = DateFormat.yMMMMd().format(pickDate);

                    doctorAuthController
                        .doctorDateOfBirthController.value.text = formatDate;
                  }
                },
                hasBackgroundColor: true,
                hintText: 'MM/DD/YYYY',
                title: AppStrings.dateOfBirth,
                controller:
                    doctorAuthController.doctorDateOfBirthController.value),

            ///==============================Email ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourMailHere,
                title: AppStrings.email,
                controller: doctorAuthController.doctorEmailController.value),

            ///==============================phone Number ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourPhoneNumberHere,
                title: AppStrings.phoneNumber,
                controller:
                    doctorAuthController.doctorPhoneNumberController.value),

            ///==============================Location ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeYourLocationHere,
                title: AppStrings.location,
                controller:
                    doctorAuthController.doctorLocationController.value),

            ///==============================password ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.password,
                controller:
                    doctorAuthController.doctorPasswordController.value),

            ///==============================Confirm Password  ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.confirmPassword,
                controller:
                    doctorAuthController.doctorConfirmPasswordController.value),

            ///================================Next button====================
            CustomButton(
              onTap: () {
                doctorAuthController.updateStep(1);
              },
              title: AppStrings.next,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
