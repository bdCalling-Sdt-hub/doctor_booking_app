

import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/doctor_side_drawer.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_appbar.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_container.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_small_container.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final DoctorHomeController controller = Get.find<DoctorHomeController>();
  final DoctorProfileController doctorProfileController =
      Get.find<DoctorProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DoctorSideDrawer(),
      key: scaffoldKey,
      backgroundColor: AppColors.whiteLightActive,
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader(); // Consider adding an error message here
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.allMethod();
              },
            );
          case Status.completed:
            return SingleChildScrollView(
              child: Column(
                children: [
                  //================================= App bar ======================
                  HomeAppbarDoctor(
                    name: AppStrings.currentLocation,
                    loacation:
                        doctorProfileController.profileModel.value.location ??
                            '',
                    scaffoldKey: scaffoldKey,
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              //================================ Total blance container ================================//
                              child: HomeContainer(
                                title: AppStrings.totalBalance,
                                subTitle: controller.doctorOverview.value
                                            .availableForReceive ==
                                        null
                                    ? '\$0'
                                    : "\$${controller.doctorOverview.value.availableForReceive.toString()}",
                              ),
                            ),
                            SizedBox(width: 23.5.h),
                            Expanded(
                              //============================= Total Appointment Container ==================
                              child: HomeContainer(
                                  title: AppStrings.totalAppointment,
                                  subTitle: controller.doctorOverview.value
                                              .totalAppointment?.completed ==
                                          null
                                      ? '0'
                                      : controller.doctorOverview.value
                                          .totalAppointment!.completed
                                          .toString()),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Obx(() {
                          //=========================== Tab Selector ==========================//
                          return CustomTabSelector(
                            tabs: controller.tabs,
                            selectedIndex: controller.tabSelectedIndex.value,
                            onTabSelected: (value) {
                              controller.tabSelectedIndex.value = value;
                            },
                            selectedColor: AppColors.grayNormal,
                            unselectedColor: AppColors.whiteNormalHover,
                            isTextColorActive: true,
                            textColor: AppColors.grayNormal,
                          );
                        }),
                        SizedBox(height: 24.h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteNormal,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.h),
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    //======================= To day button ==================//
                                    child: HomeSmallContainer(
                                      onTap: () {
                                        controller.scheduleTime.value =
                                            AppStrings.today;
                                        controller.getAllDoctorAppointment();
                                      },
                                      isActive: controller.scheduleTime.value ==
                                          AppStrings.today,
                                      title: AppStrings.today,
                                    ),
                                  ),
                                  Flexible(
                                    //=================== Weekly Button =====================//
                                    child: HomeSmallContainer(
                                      onTap: () {
                                        controller.scheduleTime.value =
                                            AppStrings.weekly;
                                        controller
                                            .getAllDoctorAppointmentWeeklyAndMonthy(
                                                AppStrings.weekly);
                                      },
                                      isActive: controller.scheduleTime.value ==
                                          AppStrings.weekly,
                                      title: AppStrings.weekly,
                                    ),
                                  ),
                                  Flexible(
                                    //============================ Monthly button ======================//
                                    child: HomeSmallContainer(
                                      onTap: () {
                                        controller.scheduleTime.value =
                                            AppStrings.monthly;
                                        controller
                                            .getAllDoctorAppointmentWeeklyAndMonthy(
                                                AppStrings.monthly);
                                      },
                                      isActive: controller.scheduleTime.value ==
                                          AppStrings.monthly,
                                      title: AppStrings.monthly,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        //====================================== Schedule List ====================================//
                        if (controller.tabSelectedIndex.value == 0)
                          //======================= To Day List ========================
                          if (controller.scheduleTime.value == AppStrings.today)
                            controller.appointMentListToday.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        controller.appointMentListToday.length,
                                        (index) {
                                      return CustomDoctorCard(
                                        imageUrl: '',
                                        patentName: controller
                                                .appointMentListToday[index]
                                                .userId
                                                ?.name ??
                                            '',
                                        time:
                                            'Today (${controller.appointMentListToday[index].time ?? ''})',
                                        loacation: controller
                                                .appointMentListToday[index]
                                                .appointmentType ??
                                            '',
                                        onTap: () {
                                          var userdetails = controller
                                              .appointMentListToday[index];
                                          Get.toNamed(AppRoutes.patientDetails,
                                              arguments: userdetails);
                                        },
                                        reScheduleButton: () {
                                          Navigator.pop(context);
                                          controller.showHomePopup(
                                              id: controller
                                                  .appointMentListToday[index]
                                                  .id
                                                  .toString());
                                        },
                                        timeTextColor: AppColors.blackO,
                                      );
                                    }),
                                  )
                                : const Center(
                                    child: CustomText(
                                      text: 'Appointment Not Available',
                                    ),
                                  ),
                        //======================= Weekly List =====================
                        if (controller.scheduleTime.value == AppStrings.weekly)
                          controller.appointMentListWeekly.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      controller.appointMentListWeekly.length,
                                      (index) {
                                    return CustomDoctorCard(
                                      imageUrl: '',
                                      patentName: controller
                                              .appointMentListWeekly[index]
                                              .userId
                                              ?.name ??
                                          '',
                                      time:
                                          'Today (${controller.appointMentListWeekly[index].time ?? ''})',
                                      loacation: controller
                                              .appointMentListWeekly[index]
                                              .appointmentType ??
                                          '',
                                      onTap: () {
                                        var userdetails = controller
                                            .appointMentListWeekly[index];
                                        Get.toNamed(AppRoutes.patientDetails,
                                            arguments: userdetails);
                                      },
                                      reScheduleButton: () {
                                        controller.showHomePopup(
                                            id: controller
                                                .appointMentListWeekly[index].id
                                                .toString());
                                      },
                                      timeTextColor: AppColors.blackO,
                                    );
                                  }),
                                )
                              : const Center(
                                  child: CustomText(
                                    text: 'Appointment Not Available',
                                  ),
                                ),
                        //======================= monthly List =====================
                        if (controller.scheduleTime.value == AppStrings.monthly)
                          controller.appointMentListMonthly.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      controller.appointMentListMonthly.length,
                                      (index) {
                                    return CustomDoctorCard(
                                      imageUrl: '',
                                      patentName: controller
                                              .appointMentListMonthly[index]
                                              .userId
                                              ?.name ??
                                          '',
                                      time:
                                          'Today (${controller.appointMentListMonthly[index].time ?? ''})',
                                      loacation: controller
                                              .appointMentListMonthly[index]
                                              .appointmentType ??
                                          '',
                                      onTap: () {
                                        var userdetails = controller
                                            .appointMentListMonthly[index];
                                        Get.toNamed(AppRoutes.patientDetails,
                                            arguments: userdetails);
                                      },
                                      reScheduleButton: () {
                                        controller.showHomePopup(
                                            id: controller
                                                .appointMentListMonthly[index]
                                                .id
                                                .toString());
                                      },
                                      timeTextColor: AppColors.blackO,
                                    );
                                  }),
                                )
                              : const Center(
                                  child: CustomText(
                                    text: 'Appointment Not Available',
                                  ),
                                ),
                        //======================================= Cancel List =================================
                        if (controller.tabSelectedIndex.value == 1)
                          Column(
                            children: [
                              SizedBox(height: 24.h),
                              CustomText(
                                text:
                                    "${AppStrings.totalCancelation} ${controller.doctorOverview.value.totalAppointment?.rejected}",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackNormal,
                              ),
                              SizedBox(height: 16.h),
                              Column(
                                children: List.generate(
                                    controller.appointMentCalcelList.length,
                                    (index) {
                                  return CustomDoctorCard(
                                    imageUrl: '',
                                    patentName: controller
                                            .appointMentCalcelList[index]
                                            .userId
                                            ?.name ??
                                        '',
                                    time:
                                        'Today (${controller.appointMentCalcelList[index].time ?? ''})',
                                    loacation: controller
                                            .appointMentCalcelList[index]
                                            .appointmentType ??
                                        '',
                                    onTap: () {
                                      var userdetails = controller
                                          .appointMentCalcelList[index];
                                      Get.toNamed(AppRoutes.patientDetails,
                                          arguments: userdetails);
                                    },
                                    reScheduleButton: () {},
                                    timeTextColor: AppColors.red,
                                  );
                                }),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      }),
      bottomNavigationBar: const DoctorNavBar(currentIndex: 0),
    );
  }
}
