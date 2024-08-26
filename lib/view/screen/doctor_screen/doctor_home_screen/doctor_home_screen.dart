import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/doctor_side_drawer.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_appbar.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_container.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_small_container.dart';
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
                  HomeAppbarDoctor(
                    name: AppStrings.currentLocation,
                    loacation: controller.profileModel.value.location!,
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
                            const Expanded(
                              child: HomeContainer(
                                title: AppStrings.totalBalance,
                                subTitle: '\$4,520',
                              ),
                            ),
                            SizedBox(width: 23.5.h),
                            const Expanded(
                              child: HomeContainer(
                                title: AppStrings.totalAppointment,
                                subTitle: '1000',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Obx(() {
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
                            Column(
                              children: List.generate(
                                  controller.appointMentList.length, (index) {
                                return CustomDoctorCard(
                                  imageUrl: '',
                                  patentName: controller.appointMentList[index]
                                          .userId?.name ??
                                      '',
                                  time:
                                      'Today (${controller.appointMentList[index].time ?? ''})',
                                  loacation: controller.appointMentList[index]
                                          .appointmentType ??
                                      '',
                                  onTap: () {
                                    var userdetails =
                                        controller.appointMentList[index];
                                    Get.toNamed(AppRoutes.patientDetails,
                                        arguments: userdetails);
                                  },
                                  reScheduleButton: () {
                                    controller.showHomePopup();
                                  },
                                  timeTextColor: AppColors.blackO,
                                );
                              }),
                            ),
                        //======================= Weekly List =====================
                        if (controller.scheduleTime.value == AppStrings.weekly)
                          Column(
                            children: List.generate(
                                controller.appointMentList.length, (index) {
                              return CustomDoctorCard(
                                imageUrl: '',
                                patentName: controller
                                        .appointMentList[index].userId?.name ??
                                    '',
                                time:
                                    'Today (${controller.appointMentList[index].time ?? ''})',
                                loacation: controller.appointMentList[index]
                                        .appointmentType ??
                                    '',
                                onTap: () {
                                  var userdetails =
                                      controller.appointMentList[index];
                                  Get.toNamed(AppRoutes.patientDetails,
                                      arguments: userdetails);
                                },
                                reScheduleButton: () {
                                  controller.showHomePopup();
                                },
                                timeTextColor: AppColors.blackO,
                              );
                            }),
                          ),
                        //======================= monthly List =====================
                        if (controller.scheduleTime.value == AppStrings.monthly)
                          Column(
                            children: List.generate(
                                controller.appointMentList.length, (index) {
                              return CustomDoctorCard(
                                imageUrl: '',
                                patentName: controller
                                        .appointMentList[index].userId?.name ??
                                    '',
                                time:
                                    'Today (${controller.appointMentList[index].time ?? ''})',
                                loacation: controller.appointMentList[index]
                                        .appointmentType ??
                                    '',
                                onTap: () {
                                  var userdetails =
                                      controller.appointMentList[index];
                                  Get.toNamed(AppRoutes.patientDetails,
                                      arguments: userdetails);
                                },
                                reScheduleButton: () {
                                  controller.showHomePopup();
                                },
                                timeTextColor: AppColors.blackO,
                              );
                            }),
                          ),
                        //======================================= Cancel List =================================
                        if (controller.tabSelectedIndex.value == 1)
                          Column(
                            children: [
                              SizedBox(height: 24.h),
                              CustomText(
                                text: "${AppStrings.totalCancelation} 12",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackNormal,
                              ),
                              SizedBox(height: 16.h),
                              Column(
                                children: List.generate(
                                    controller.appointMentList.length, (index) {
                                  return CustomDoctorCard(
                                    imageUrl: '',
                                    patentName: controller
                                            .appointMentList[index]
                                            .userId
                                            ?.name ??
                                        '',
                                    time:
                                        'Today (${controller.appointMentList[index].time ?? ''})',
                                    loacation: controller.appointMentList[index]
                                            .appointmentType ??
                                        '',
                                    onTap: () {
                                      var userdetails =
                                          controller.appointMentList[index];
                                      Get.toNamed(AppRoutes.patientDetails,
                                          arguments: userdetails);
                                    },
                                    reScheduleButton: () {
                                      controller.showHomePopup();
                                    },
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
