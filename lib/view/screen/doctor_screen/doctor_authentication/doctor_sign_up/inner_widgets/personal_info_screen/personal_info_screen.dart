import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_auth_controller/doctor_auth_controller.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ///==============================Your Name ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourNameHere,
                title: AppStrings.yourName,
                controller: doctorAuthController.doctorNameController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

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
                    doctorAuthController.doctorDateOfBirthController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///==============================Email ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourMailHere,
                title: AppStrings.email,
                controller: doctorAuthController.doctorEmailController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///==============================phone Number ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourPhoneNumberHere,
                title: AppStrings.phoneNumber,
                controller:
                    doctorAuthController.doctorPhoneNumberController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///==============================Location ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeYourLocationHere,
                title: AppStrings.location,
                controller: doctorAuthController.doctorLocationController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///==============================password ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.password,
                controller: doctorAuthController.doctorPasswordController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///==============================Confirm Password  ======================
              CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.confirmPassword,
                controller:
                    doctorAuthController.doctorConfirmPasswordController.value,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return AppStrings.fieldCantBeEmpty;
                  }
                  return null;
                },
              ),

              ///================================Next button====================
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    doctorAuthController.updateStep(1);
                  }
                },
                title: AppStrings.next,
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
