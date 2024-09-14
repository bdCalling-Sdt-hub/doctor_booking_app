import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
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

import '../../../../service/api_url.dart';

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
                controller.refreshScreen(controller.tabSelectedIndex.value);
              },
            );
          case Status.completed:
            return RefreshIndicator(
              backgroundColor: AppColors.blackNormal,
              color: AppColors.white,
              onRefresh: () =>
                  controller.refreshScreen(controller.tabSelectedIndex.value),
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
                  Expanded(
                    child: Padding(
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

                                controller.refreshScreen(value);
                                if (value == 0) {
                                  controller.getAllDoctorAppointment(
                                      status: AppStrings.accepted,
                                      type: AppStrings.todaySmall);
                                  controller.setType.value =
                                      AppStrings.todaySmall;
                                  controller.scheduleTime.value =
                                      AppStrings.today;
                                }
                              },
                              selectedColor: AppColors.grayNormal,
                              unselectedColor: AppColors.whiteNormalHover,
                              isTextColorActive: true,
                              textColor: AppColors.grayNormal,
                            );
                          }),
                          SizedBox(height: 16.h),

                          //====================================== Schedule List ====================================//
                          if (controller.tabSelectedIndex.value == 0)
                            //=============== Today === Weekly and monthly field =================================
                            _toDayWeeklyMonthlyField(context),
                          SizedBox(height: 16.h),
                          if (controller.tabSelectedIndex.value == 0)
                            //======================= To Day List ========================
                            if (controller.scheduleTime.value ==
                                    AppStrings.today &&
                                controller.tabSelectedIndex.value == 0)
                              controller.appointMentList.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                          controller: controller
                                              .homescrollControloler.value,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.appointMentList.length,
                                          itemBuilder: (context, index) {
                                            var data = controller
                                                .appointMentList[index];
                                            if (!controller
                                                .isLoadMoreRunning.value) {
                                              return CustomDoctorCard(
                                                imageUrl:
                                                    "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                                                patentName:
                                                    data.userId?.name ?? '',
                                                time:
                                                    'Today (${data.time ?? ''})',
                                                loacation:
                                                    data.appointmentType ?? '',
                                                onTap: () => Get.toNamed(
                                                    AppRoutes.patientDetails,
                                                    arguments: data),
                                                reScheduleButton: () {
                                                  Navigator.pop(context);
                                                  controller.showHomePopup(
                                                      id: data.id.toString());
                                                },
                                                timeTextColor: AppColors.blackO,
                                                videoCallOrConsaltentDoneButton:
                                                    () {},
                                                typeOnline: data
                                                            .appointmentType ==
                                                        null
                                                    ? null
                                                    : data.appointmentType! ==
                                                            AppStrings.online
                                                        ? true
                                                        : false,
                                                showVideoCallOrConsalttentButton:
                                                    DateConverter
                                                        .isWithin30MinutesOfTime(
                                                            data.date ?? '',
                                                            data.time ?? ''),
                                              );
                                            } else {
                                              return const CustomLoader();
                                            }
                                          }),
                                    )
                                  : _emptyList(),
                          //======================= Weekly List =====================
                          if (controller.scheduleTime.value ==
                                  AppStrings.weekly &&
                              controller.tabSelectedIndex.value == 0)
                            controller.appointMentList.isNotEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                        controller: controller
                                            .homescrollControloler.value,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.appointMentList.length,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var data =
                                              controller.appointMentList[index];
                                          if (!controller
                                              .isLoadMoreRunning.value) {
                                            return CustomDoctorCard(
                                              imageUrl:
                                                  "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                                              patentName:
                                                  data.userId?.name ?? '',
                                              time:
                                                  "${DateConverter.formatDate(data.date ?? '')}(${data.time})",
                                              loacation:
                                                  data.appointmentType ?? '',
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.patientDetails,
                                                    arguments: data);
                                              },
                                              reScheduleButton: () {
                                                Navigator.pop(context);
                                                controller.showHomePopup(
                                                    id: data.id.toString());
                                              },
                                              timeTextColor: AppColors.blackO,
                                            );
                                          } else {
                                            return const CustomLoader();
                                          }
                                        }),
                                  )
                                : _emptyList(),
                          //======================= monthly List =====================
                          if (controller.scheduleTime.value ==
                                  AppStrings.monthly &&
                              controller.tabSelectedIndex.value == 0)
                            controller.appointMentList.isNotEmpty
                                ? _showMonthlyList()
                                : _emptyList(),

                          if (controller.tabSelectedIndex.value == 1)
                            controller.appointMentList.isNotEmpty
                                ? _showCompltedList()
                                : _emptyList(),

                          //======================================= Cancel List =================================
                          if (controller.tabSelectedIndex.value == 2)
                            controller.appointMentList.isNotEmpty
                                ? _showCancelList()
                                : _emptyList(),
                        ],
                      ),
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

  _showMonthlyList() {
    return Expanded(
      child: ListView.builder(
          controller: controller.homescrollControloler.value,
          padding: EdgeInsets.zero,
          itemCount: controller.appointMentList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = controller.appointMentList[index];
            if (!controller.isLoadMoreRunning.value) {
              return CustomDoctorCard(
                imageUrl: "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                patentName: data.userId?.name ?? '',
                time:
                    "${DateConverter.formatDate(data.date ?? '')}(${data.time})",
                loacation: data.appointmentType ?? '',
                onTap: () =>
                    Get.toNamed(AppRoutes.patientDetails, arguments: data),
                reScheduleButton: () {
                  Navigator.pop(context);
                  controller.showHomePopup(id: data.id.toString());
                },
                timeTextColor: AppColors.blackO,
              );
            } else {
              return const CustomLoader();
            }
          }),
    );
  }

  _showCompltedList() {
    return Expanded(
      child: ListView.builder(
          controller: controller.homescrollControloler.value,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: controller.appointMentList.length,
          itemBuilder: (context, index) {
            var data = controller.appointMentList[index];
            if (!controller.isLoadMoreRunning.value) {
              return CustomDoctorCard(
                imageUrl: "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                patentName: data.userId?.name ?? '',
                time:
                    "${DateConverter.formatDate(data.date ?? '')}(${data.time})",
                loacation: data.appointmentType ?? '',
                onTap: () =>
                    Get.toNamed(AppRoutes.patientDetails, arguments: data),
                showPopupButton: false,
                timeTextColor: AppColors.blackO,
              );
            } else {
              return const CustomLoader();
            }
          }),
    );
  }

  _showCancelList() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 8.h),
          CustomText(
            text:
                "${AppStrings.totalCancelation} ${controller.doctorOverview.value.totalAppointment?.rejected}",
            fontSize: 14.w,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
          ),
          SizedBox(height: 16.h),
          ListView.builder(
              controller: controller.homescrollControloler.value,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.appointMentList.length,
              itemBuilder: (context, index) {
                var data = controller.appointMentList[index];
                if (!controller.isLoadMoreRunning.value) {
                  return CustomDoctorCard(
                    imageUrl: "${ApiUrl.imageBaseUrl}${data.userId?.img}",
                    patentName: data.userId?.name ?? '',
                    time:
                        "${DateConverter.formatDate(data.date ?? '')}(${data.time})",
                    loacation: data.appointmentType ?? '',
                    onTap: () {
                      var userdetails = controller.appointMentList[index];
                      Get.toNamed(AppRoutes.patientDetails,
                          arguments: userdetails);
                    },
                    reScheduleButton: () {},
                    timeTextColor: AppColors.red,
                    showPopupButton: false,
                  );
                } else {
                  return const CustomLoader();
                }
              })
        ],
      ),
    );
  }

  Widget _toDayWeeklyMonthlyField(context) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                //======================= To day button ==================//
                child: HomeSmallContainer(
                  onTap: () {
                    controller.scheduleTime.value = AppStrings.today;
                    controller.setType.value = AppStrings.todaySmall;
                    controller.getAllDoctorAppointment(
                      status: AppStrings.accepted,
                      type: AppStrings.todaySmall,
                    );
                  },
                  isActive: controller.scheduleTime.value == AppStrings.today,
                  title: AppStrings.today,
                ),
              ),
              Flexible(
                //=================== Weekly Button =====================//
                child: HomeSmallContainer(
                  onTap: () {
                    controller.scheduleTime.value = AppStrings.weekly;

                    controller.setType.value = AppStrings.weeklySmall;
                    controller.getAllDoctorAppointment(
                      status: AppStrings.accepted,
                      type: AppStrings.weeklySmall,
                    );
                  },
                  isActive: controller.scheduleTime.value == AppStrings.weekly,
                  title: AppStrings.weekly,
                ),
              ),
              Flexible(
                //============================ Monthly button ======================//
                child: HomeSmallContainer(
                  onTap: () {
                    controller.scheduleTime.value = AppStrings.monthly;

                    controller.setType.value = AppStrings.monthlySmall;
                    controller.getAllDoctorAppointment(
                      status: AppStrings.accepted,
                      type: AppStrings.monthlySmall,
                    );
                  },
                  isActive: controller.scheduleTime.value == AppStrings.monthly,
                  title: AppStrings.monthly,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  _emptyList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        const Center(
          child: CustomText(
            text: 'Appointment Not Available',
          ),
        ),
      ],
    );
  }
}
