import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/custom_appointment_info.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentInfoScreen extends StatelessWidget {
  AppointmentInfoScreen({super.key});

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppointmentInfo(
                dayName: 'Sunday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Monday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Tuesday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Wednesday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Thursday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Friday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomAppointmentInfo(
                dayName: 'Saturday',
                startTimeTap: () {},
                endTimeTap: () {},
                availableTab: () {}),
            CustomButton(
              onTap: () {
                doctorAuthController.updateStep(2);
              },
              title: AppStrings.next,
            ),
          ],
        ),
      ),
    );
  }
}
