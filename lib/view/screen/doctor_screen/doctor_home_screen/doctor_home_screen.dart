import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_appbar.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_container.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/home_small_container.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///==================================Home Appbar=======================
            const HomeAppbarDoctor(
              name: AppStrings.currentLocation,
              loacation: AppStrings.californiaUsa,
              // scaffoldKey: scaffoldKey,
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
                      const HomeContainer(
                        title: AppStrings.totalBalance,
                        subTitle: '\$4,520',
                      ),
                      SizedBox(
                        width: 23.5.h,
                      ),
                      const HomeContainer(
                        title: AppStrings.totalAppointment,
                        subTitle: '1000',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: AppStrings.schedule,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayNormal),
                      CustomText(
                          text: AppStrings.cancel,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayNormal),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    width: 375.w,
                    height: 2.h,
                    color: AppColors.whiteNormal,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: 335.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteNormal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.today;
                                  },
                                  bgColor: controller.scheduleTime.value ==
                                          AppStrings.today
                                      ? AppColors.blackNormal
                                      : AppColors.blackLight,
                                  textColor: controller.scheduleTime.value ==
                                          AppStrings.today
                                      ? AppColors.whiteNormal
                                      : AppColors.blackNormal,
                                  borderColor: controller.scheduleTime.value ==
                                          AppStrings.today
                                      ? Colors.transparent
                                      : AppColors.grayLightHover,
                                  title: AppStrings.today),
                              HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.weekly;
                                  },
                                  bgColor: controller.scheduleTime.value ==
                                          AppStrings.weekly
                                      ? AppColors.blackNormal
                                      : AppColors.blackLight,
                                  textColor: controller.scheduleTime.value ==
                                          AppStrings.weekly
                                      ? AppColors.whiteNormal
                                      : AppColors.blackNormal,
                                  borderColor: controller.scheduleTime.value ==
                                          AppStrings.weekly
                                      ? Colors.transparent
                                      : AppColors.grayLightHover,
                                  title: AppStrings.weekly),
                              HomeSmallContainer(
                                  onTap: () {
                                    controller.scheduleTime.value =
                                        AppStrings.monthly;
                                  },
                                  bgColor: controller.scheduleTime.value ==
                                          AppStrings.monthly
                                      ? AppColors.blackNormal
                                      : AppColors.blackLight,
                                  textColor: controller.scheduleTime.value ==
                                          AppStrings.monthly
                                      ? AppColors.whiteNormal
                                      : AppColors.blackNormal,
                                  borderColor: controller.scheduleTime.value ==
                                          AppStrings.monthly
                                      ? Colors.transparent
                                      : AppColors.grayLightHover,
                                  title: AppStrings.monthly),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  Column(
                    children: List.generate(4, (index) {
                      return CustomDoctorCard(
                          imageUrl: AppConstants.userNtr,
                          patentName: 'Heart Disease',
                          time: 'Today  ( 12 : 00 AM )',
                          loacation: 'Online Appointment',
                          onTap: () {});
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      bottomNavigationBar: DoctorNavBar(currentIndex: 0),
    );
  }
}
