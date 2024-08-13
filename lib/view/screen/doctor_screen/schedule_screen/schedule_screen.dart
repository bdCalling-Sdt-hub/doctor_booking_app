import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_booking/controller/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/inner_widget.dart/schedule_patient_list.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            //===================== Calender ====================//
            Container(
              color: AppColors.whiteNormal,
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.multi,
                ),
                value: const [],
                onValueChanged: (dates) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: Column(
                children: [
//================= patient liat ================//
                  // SizedBox(
                  //   height: 25.h,
                  // ),

                  SchedulePatientList(
                    patientImageList: const [],
                    onTap: () {
                      Get.toNamed(AppRoutes.allPatientListScreen);
                    },
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

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
                    return scheduleController.tabCurrentIndex.value == 0
                        ? Column(
                            children: List.generate(
                              5,
                              (index) {
                                return CustomDoctorCard(
                                  imageUrl: AppConstants.userNtr,
                                  patentName: 'Heart Disease',
                                  time: '05-12-24 (12:00 AM)',
                                  loacation: '3 rue Paul Bert 75011 Paris',
                                  onTap: () {},
                                );
                              },
                            ),
                          )
                        : scheduleController.tabCurrentIndex.value == 1
                            ? Column(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return CustomDoctorCard(
                                      imageUrl: AppConstants.userNtr,
                                      patentName: 'Masum Raj',
                                      time: '05-12-24 (12:00 AM)',
                                      loacation: '3 rue Paul Bert 75011 Paris',
                                      onTap: () {},
                                    );
                                  },
                                ),
                              )
                            : Column(
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
