import 'package:doctor_booking/controller/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  final DoctorScheduleController scheduleController =
      Get.find<DoctorScheduleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 1),

      ///================= Appbar ====================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.schedule,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: Column(
                children: [
                  //========================== Calender =========================

                  // CustomCalender(
                  //   minDate: DateTime.now(),
                  //   maxDate: DateTime(2090),
                  //   initialDate: DateTime.now(),
                  //   onDateChange: (date) {},
                  //   activeBackgroundColor: AppColors.blackNormal,
                  //   monthColor: AppColors.blackNormal,
                  //   showNavigationButtons: false,
                  //   inactiveBackgroundColor: AppColors.whiteDarkHover,
                  //   weekStartFrom: WeekStartFrom.sunday,
                  //   inactiveTextColor: AppColors.blackNormal,
                  //   horizontalPadding: 10.w,
                  // ),

//================= patient liat ================//

                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // SchedulePatientList(
                  //   patientImageList: const [],
                  //   onTap: () {
                  //     Get.toNamed(AppRoutes.allPatientListScreen);
                  //   },
                  // ),

                  // SizedBox(
                  //   height: 10.h,
                  // ),

                  //============================ Tab view ========================//
                  Obx(() {
                    return CustomTabSelector(
                      tabs: scheduleController.scheduleTabs,
                      selectedIndex: scheduleController.tabCurrentIndex.value,
                      onTabSelected: (value) {
                        scheduleController.tabCurrentIndex.value = value;
                      },
                      selectedColor: AppColors.grayNormal,
                      unselectedColor: AppColors.grayLightHover,
                      isTextColorActive: true,
                      textColor: AppColors.grayNormal.withOpacity(.5),
                    );
                  }),
                  SizedBox(
                    height: 25.h,
                  ),
                  ////========================= patient List ====================//
                  Obx(() {
                    if (scheduleController.tabCurrentIndex.value == 0) {
                      return Column(
                          children: List.generate(
                        scheduleController.appointMentAllList.length,
                        (index) {
                          return CustomDoctorCard(
                            imageUrl: scheduleController
                                    .appointMentAllList[index].userId?.img ??
                                '',
                            patentName: scheduleController
                                    .appointMentAllList[index].userId?.name ??
                                '',
                            time:
                                '${scheduleController.appointMentAllList[index].date != null ? DateFormat.yMMMd().format(scheduleController.appointMentAllList[index].date!) : ''} (${scheduleController.appointMentAllList[index].time ?? ''})',
                            loacation: scheduleController
                                    .appointMentAllList[index]
                                    .userId
                                    ?.location ??
                                '',
                            onTap: () {},
                          );
                        },
                      ));
                    } else if (scheduleController.tabCurrentIndex.value == 1) {
                      return Column(
                        children: List.generate(
                          scheduleController.pendingAppointmentList.length,
                          (index) {
                            return CustomDoctorCard(
                              imageUrl: scheduleController
                                      .pendingAppointmentList[index]
                                      .userId
                                      ?.img ??
                                  '',
                              patentName: scheduleController
                                      .pendingAppointmentList[index]
                                      .userId
                                      ?.name ??
                                  '',
                              time:
                                  '${scheduleController.pendingAppointmentList[index].date != null ? DateFormat.yMMMd().format(scheduleController.pendingAppointmentList[index].date!) : ''} (${scheduleController.pendingAppointmentList[index].time ?? ''})',
                              loacation: scheduleController
                                      .pendingAppointmentList[index]
                                      .userId
                                      ?.location ??
                                  '',
                              onTap: () {},
                            );
                          },
                        ),
                      );
                    } else {
                      return Column(
                        children: List.generate(
                          5,
                          (index) {
                            return CustomDoctorCard(
                              imageUrl: AppConstants.userNtr,
                              patentName: 'Siyam ',
                              time: '05-12-24 (12:00 AM)',
                              loacation: '3 rue Paul Bert 75011 Paris',
                              onTap: () {},
                            );
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
