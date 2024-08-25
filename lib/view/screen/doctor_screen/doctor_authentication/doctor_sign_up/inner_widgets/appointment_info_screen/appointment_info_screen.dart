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
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              ///================================= Sunday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.sundayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Sunday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 1, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 1, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.sundayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.sundayTypeController.refresh();
                },
                startController:
                    doctorAuthController.sundayStartTimeController.value,
                endController:
                    doctorAuthController.sundayEndTimeController.value,
              ),

              ///================================= Monday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.mondayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Monday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 2, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 2, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.mondayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.mondayTypeController.refresh();
                },
                startController:
                    doctorAuthController.mondayStartTimeController.value,
                endController:
                    doctorAuthController.mondayEndTimeController.value,
              ),

              ///================================= Tuesday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.tuesdayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Tuesday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 3, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 3, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.tuesdayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.tuesdayTypeController.refresh();
                },
                startController:
                    doctorAuthController.tuesdayStartTimeController.value,
                endController:
                    doctorAuthController.tuesdayEndTimeController.value,
              ),

              ///================================= Wednesday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.weddayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Wednesday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 4, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 4, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.weddayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.weddayTypeController.refresh();
                },
                startController:
                    doctorAuthController.weddayStartTimeController.value,
                endController:
                    doctorAuthController.weddayEndTimeController.value,
              ),

              ///================================= Thursday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.thursdayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Thursday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 5, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 5, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.thursdayTypeController.value.text =
                      value ?? "";

                  doctorAuthController.thursdayTypeController.refresh();
                },
                startController:
                    doctorAuthController.thursdayStartTimeController.value,
                endController:
                    doctorAuthController.thursdayEndTimeController.value,
              ),

              ///================================= Friday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.fridayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Friday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 6, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 6, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.fridayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.fridayTypeController.refresh();
                },
                startController:
                    doctorAuthController.fridayStartTimeController.value,
                endController:
                    doctorAuthController.fridayEndTimeController.value,
              ),

              ///================================= Saturday =============================

              CustomAppointmentInfo(
                isClosed:
                    doctorAuthController.saturdayTypeController.value.text ==
                        AppStrings.weekend,
                dayName: 'Saturday',
                startTimeTap: () async {
                  await doctorAuthController.getTime(day: 7, num: 1);
                },
                endTimeTap: () async {
                  await doctorAuthController.getTime(day: 7, num: 2);
                },
                availableTab: (value) {
                  doctorAuthController.saturdayTypeController.value.text =
                      value ?? "";
                  doctorAuthController.saturdayTypeController.refresh();
                },
                startController:
                    doctorAuthController.saturdayStartTimeController.value,
                endController:
                    doctorAuthController.saturdayEndTimeController.value,
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
        );
      }),
    );
  }
}
