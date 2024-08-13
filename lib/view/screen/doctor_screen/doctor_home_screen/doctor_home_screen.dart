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
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///==================================Home Appbar=======================
            HomeAppbarDoctor(
              name: AppStrings.currentLocation,
              loacation: AppStrings.californiaUsa,
              scaffoldKey: scaffoldKey,
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
              child: Column(
                children: [
                  ///===============================Total Card==========================
                  Row(
                    children: [
                      const Flexible(
                        child: HomeContainer(
                          title: AppStrings.totalBalance,
                          subTitle: '\$4,520',
                        ),
                      ),
                      SizedBox(
                        width: 23.5.h,
                      ),
                      const Flexible(
                        child: HomeContainer(
                          title: AppStrings.totalAppointment,
                          subTitle: '1000',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///============= Schedule or Cancel tab view ========///

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

                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteNormal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.h),
                      child: Obx(
                        () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///============= To Day Container ===========//
                              Flexible(
                                child: HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.today;
                                  },
                                  isActive: controller.scheduleTime.value ==
                                          AppStrings.today
                                      ? true
                                      : false,
                                  title: AppStrings.today,
                                ),
                              ),
                              //=============== Weekly Container ==========////

                              Flexible(
                                child: HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.weekly;
                                  },
                                  isActive: controller.scheduleTime.value ==
                                          AppStrings.weekly
                                      ? true
                                      : false,
                                  title: AppStrings.weekly,
                                ),
                              ),

                              ///================== Monthly Container ============///
                              Flexible(
                                child: HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.monthly;
                                  },
                                  isActive: controller.scheduleTime.value ==
                                          AppStrings.monthly
                                      ? true
                                      : false,
                                  title: AppStrings.monthly,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //=============== Patent List ===========////
                  Obx(
                    () {
                      return controller.tabSelectedIndex == 0
                          ? Column(
                              children: List.generate(4, (index) {
                                return CustomDoctorCard(
                                  imageUrl: AppConstants.userNtr,
                                  patentName: 'Heart Disease',
                                  time: 'Today  ( 12 : 00 AM )',
                                  loacation: 'Online Appointment',
                                  onTap: () {
                                    Get.toNamed(AppRoutes.patientDetails);
                                  },
                                  reScheduleButton: () {
                                    controller.showHomePopup();
                                  },
                                );
                              }),
                            )
                          : Column(
                              children: List.generate(
                                4,
                                (index) {
                                  return CustomDoctorCard(
                                    imageUrl: AppConstants.userNtr,
                                    patentName: 'Heart Disease',
                                    time: 'Today  ( 12 : 00 AM )',
                                    loacation: 'Online Appointment',
                                    onTap: () {
                                      Get.toNamed(AppRoutes.patientDetails);
                                    },
                                    reScheduleButton: () {
                                      controller.showHomePopup();
                                    },
                                    timeTextColor: AppColors.red,
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      bottomNavigationBar: DoctorNavBar(currentIndex: 0),
    );
  }
}
