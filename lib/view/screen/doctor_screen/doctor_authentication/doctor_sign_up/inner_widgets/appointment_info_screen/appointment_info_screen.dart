import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/custom_appointment_info.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Obx(() {
              return CustomAppointmentInfo(
                dayName: 'Sunday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 1, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 1, num: 2);
                },
                availableTab: () {},
                startController:
                    doctorAuthController.sundayStartTimeController.value,
                endController:
                    doctorAuthController.sundayEndTimeController.value,
              );
            }),
            CustomAppointmentInfo(
              dayName: 'Monday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 2, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 2, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.mondayStartTimeController.value,
              endController: doctorAuthController.mondayEndTimeController.value,
            ),
            CustomAppointmentInfo(
              dayName: 'Tuesday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 3, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 3, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.tuesdayStartTimeController.value,
              endController:
                  doctorAuthController.tuesdayEndTimeController.value,
            ),
            CustomAppointmentInfo(
              dayName: 'Wednesday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 4, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 4, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.weddayStartTimeController.value,
              endController: doctorAuthController.weddayEndTimeController.value,
            ),
            CustomAppointmentInfo(
              dayName: 'Thursday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 5, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 5, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.thursdayStartTimeController.value,
              endController:
                  doctorAuthController.thursdayEndTimeController.value,
            ),
            CustomAppointmentInfo(
              dayName: 'Friday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 6, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 6, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.frydayStartTimeController.value,
              endController: doctorAuthController.frydayEndTimeController.value,
            ),
            CustomAppointmentInfo(
              dayName: 'Saturday',
              startTimeTap: () async {
                await doctorAuthController.getTime(day: 7, num: 1);
              },
              endTimeTap: () async {
                await doctorAuthController.getTime(day: 7, num: 2);
              },
              availableTab: () {},
              startController:
                  doctorAuthController.satardayStartTimeController.value,
              endController:
                  doctorAuthController.satardayEndTimeController.value,
            ),
            CustomButton(
              onTap: () {
                doctorAuthController.updateStep(2);
              },
              title: AppStrings.next,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
