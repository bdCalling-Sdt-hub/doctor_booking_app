import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalInfoScreen extends StatelessWidget {
   PersonalInfoScreen({super.key});


  final DoctorAuthController doctorAuthController = Get.find<DoctorAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.whiteLightActive,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///==============================Your Name ======================
            CustomFormCard(
              hasBackgroundColor: true,
                hintText: AppStrings.yourNameHere,
                title: AppStrings.yourName, controller: TextEditingController()),

            ///==============================Date of birth ======================
            CustomFormCard(
              hasBackgroundColor: true,
                hintText: 'dd/mm/yy',
                title:AppStrings.dateOfBirth, controller: TextEditingController()),

            ///==============================Email ======================
            CustomFormCard(
              hasBackgroundColor: true,
                hintText: AppStrings.yourMailHere,
                title: AppStrings.email, controller: TextEditingController()),


            ///==============================phone Number ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.yourPhoneNumberHere,
                title: AppStrings.phoneNumber, controller: TextEditingController()),

            ///==============================Location ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.typeYourLocationHere,
                title: AppStrings.location, controller: TextEditingController()),

            ///==============================password ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.password, controller: TextEditingController()),

            ///==============================Confirm Password  ======================
            CustomFormCard(
                hasBackgroundColor: true,
                hintText: AppStrings.enterPassword,
                title: AppStrings.confirmPassword, controller: TextEditingController()),

            ///================================Next button====================
            CustomButton(onTap: (){
              doctorAuthController.updateStep(1);
            },title: AppStrings.next
              ,),
            SizedBox(
              height: 20.h
              ,
            )
          ],
        ),
      ),
    );
  }
}
