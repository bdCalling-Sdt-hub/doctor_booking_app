import 'package:doctor_booking/controller/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/widget/custom_appointment_info.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
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
        appBarContent: 'Edit Appointment Info',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Obx(() {
            return Column(
              children: [
                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
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
                    debugPrint(value);
                    if (value == AppStrings.weekend) {
                      profileController.sundayStartTimeController.value.clear();
                      profileController.sundayEndTimeController.value.clear();
                      profileController.sundayAvailableList.value = [];
                    }
                  },
                  typeHintText:
                      profileController.sundayTypeController.value.text,
                  startController:
                      profileController.sundayStartTimeController.value,
                  endController:
                      profileController.sundayEndTimeController.value,
                ),

                ///================================= Monday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
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
                    if (value == AppStrings.weekend) {
                      profileController.mondayStartTimeController.value.clear();
                      profileController.mondayEndTimeController.value.clear();
                      profileController.mondayAvailableList.value = [];
                    }
                  },
                  startController:
                      profileController.mondayStartTimeController.value,
                  endController:
                      profileController.mondayEndTimeController.value,
                  typeHintText:
                      profileController.mondayTypeController.value.text,
                ),

                ///================================= Tuesday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
                  isClosed:
                      profileController.tuesdayTypeController.value.text ==
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
                    if (value == AppStrings.weekend) {
                      profileController.tuesdayStartTimeController.value
                          .clear();
                      profileController.tuesdayEndTimeController.value.clear();
                      profileController.tuedayAvailableList.value = [];
                    }
                  },
                  startController:
                      profileController.tuesdayStartTimeController.value,
                  endController:
                      profileController.tuesdayEndTimeController.value,
                  typeHintText:
                      profileController.tuesdayTypeController.value.text,
                ),

                ///================================= Wednesday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
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
                    if (value == AppStrings.weekend) {
                      profileController.weddayStartTimeController.value.clear();
                      profileController.weddayEndTimeController.value.clear();
                      profileController.weddayAvailableList.value = [];
                    }
                  },
                  startController:
                      profileController.weddayStartTimeController.value,
                  endController:
                      profileController.weddayEndTimeController.value,
                  typeHintText:
                      profileController.weddayTypeController.value.text,
                ),

                ///================================= Thursday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
                  isClosed:
                      profileController.thursdayTypeController.value.text ==
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

                    if (value == AppStrings.weekend) {
                      profileController.thursdayStartTimeController.value
                          .clear();
                      profileController.thursdayEndTimeController.value.clear();
                      profileController.thudayAvailableList.value = [];
                    }
                  },
                  startController:
                      profileController.thursdayStartTimeController.value,
                  endController:
                      profileController.thursdayEndTimeController.value,
                  typeHintText:
                      profileController.thursdayTypeController.value.text,
                ),

                ///================================= Friday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
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
                    if (value == AppStrings.weekend) {
                      profileController.fridayStartTimeController.value.clear();
                      profileController.fridayEndTimeController.value.clear();
                      profileController.fridayAvailableList.value = [];
                    }
                  },
                  startController:
                      profileController.fridayStartTimeController.value,
                  endController:
                      profileController.fridayEndTimeController.value,
                  typeHintText:
                      profileController.fridayTypeController.value.text,
                ),

                ///================================= Saturday =============================

                CustomAppointmentInfo(
                  startTimeHintText: AppStrings.updateTime,
                  endTimeHintText: AppStrings.updateTime,
                  isClosed:
                      profileController.saturdayTypeController.value.text ==
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
                    if (value == AppStrings.weekend) {
                      profileController.saturdayStartTimeController.value
                          .clear();
                      profileController.saturdayStartTimeController.refresh();
                      profileController.saturdayEndTimeController.value.clear();
                      profileController.saturdayEndTimeController.refresh();
                      profileController.satdayAvailableList.value = [];
                      profileController.satdayAvailableList.refresh();
                    }
                  },
                  startController:
                      profileController.saturdayStartTimeController.value,
                  endController:
                      profileController.saturdayEndTimeController.value,
                  typeHintText:
                      profileController.saturdayTypeController.value.text,
                ),
                profileController.updateAppointmentLoading.value
                    ? const CustomLoader()
                    //========================= Update Button ========================//
                    : CustomButton(
                        onTap: () async {
                          await profileController.updateDoctorAppointment();
                        },
                        title: AppStrings.update,
                      ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
