import 'package:doctor_booking/controller/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/custom_appointment_info.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorEditAppointmentScreen extends StatelessWidget {
  DoctorEditAppointmentScreen({super.key});

  final DoctorProfileController profileController =
      Get.find<DoctorProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        appBarContent: 'Appointment Info',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              CustomAppointmentInfo(
                isClosed: profileController.sundayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Sunday',
                startTimeTap: () async {
                  await profileController.getTime(day: 1, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 1, num: 2);
                },
                availableTab: (value) {
                  profileController.sundayTypeController.value.text =
                      value ?? "";
                  profileController.sundayTypeController.refresh();
                },
                startController:
                    profileController.sundayStartTimeController.value,
                endController: profileController.sundayEndTimeController.value,
              ),

              ///================================= Monday =============================

              CustomAppointmentInfo(
                isClosed: profileController.mondayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Monday',
                startTimeTap: () async {
                  await profileController.getTime(day: 2, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 2, num: 2);
                },
                availableTab: (value) {
                  profileController.mondayTypeController.value.text =
                      value ?? "";
                  profileController.mondayTypeController.refresh();
                },
                startController:
                    profileController.mondayStartTimeController.value,
                endController: profileController.mondayEndTimeController.value,
              ),

              ///================================= Tuesday =============================

              CustomAppointmentInfo(
                isClosed: profileController.tuesdayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Tuesday',
                startTimeTap: () async {
                  await profileController.getTime(day: 3, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 3, num: 2);
                },
                availableTab: (value) {
                  profileController.tuesdayTypeController.value.text =
                      value ?? "";
                  profileController.tuesdayTypeController.refresh();
                },
                startController:
                    profileController.tuesdayStartTimeController.value,
                endController: profileController.tuesdayEndTimeController.value,
              ),

              ///================================= Wednesday =============================

              CustomAppointmentInfo(
                isClosed: profileController.weddayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Wednesday',
                startTimeTap: () async {
                  await profileController.getTime(day: 4, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 4, num: 2);
                },
                availableTab: (value) {
                  profileController.weddayTypeController.value.text =
                      value ?? "";
                  profileController.weddayTypeController.refresh();
                },
                startController:
                    profileController.weddayStartTimeController.value,
                endController: profileController.weddayEndTimeController.value,
              ),

              ///================================= Thursday =============================

              CustomAppointmentInfo(
                isClosed: profileController.thursdayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Thursday',
                startTimeTap: () async {
                  await profileController.getTime(day: 5, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 5, num: 2);
                },
                availableTab: (value) {
                  profileController.thursdayTypeController.value.text =
                      value ?? "";

                  profileController.thursdayTypeController.refresh();
                },
                startController:
                    profileController.thursdayStartTimeController.value,
                endController:
                    profileController.thursdayEndTimeController.value,
              ),

              ///================================= Friday =============================

              CustomAppointmentInfo(
                isClosed: profileController.fridayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Friday',
                startTimeTap: () async {
                  await profileController.getTime(day: 6, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 6, num: 2);
                },
                availableTab: (value) {
                  profileController.fridayTypeController.value.text =
                      value ?? "";
                  profileController.fridayTypeController.refresh();
                },
                startController:
                    profileController.fridayStartTimeController.value,
                endController: profileController.fridayEndTimeController.value,
              ),

              ///================================= Saturday =============================

              CustomAppointmentInfo(
                isClosed: profileController.saturdayTypeController.value.text ==
                    AppStrings.weekend,
                dayName: 'Saturday',
                startTimeTap: () async {
                  await profileController.getTime(day: 7, num: 1);
                },
                endTimeTap: () async {
                  await profileController.getTime(day: 7, num: 2);
                },
                availableTab: (value) {
                  profileController.saturdayTypeController.value.text =
                      value ?? "";
                  profileController.saturdayTypeController.refresh();
                },
                startController:
                    profileController.saturdayStartTimeController.value,
                endController:
                    profileController.saturdayEndTimeController.value,
              ),
              CustomButton(
                onTap: () {},
                title: AppStrings.update,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
