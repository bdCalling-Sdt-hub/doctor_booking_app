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
                        //  SizedBox(height: 24.h),

                        SizedBox(height: 16.h),
                        //====================================== Schedule List ====================================//
                        if (controller.tabSelectedIndex.value == 0)
                          //=============== Today === Weekly and monthly field =================================
                          _toDayWeeklyMonthlyField(context),
                        if (controller.tabSelectedIndex.value == 0)
                          //======================= To Day List ========================
                          if (controller.scheduleTime.value ==
                                  AppStrings.today &&
                              controller.tabSelectedIndex.value == 0)
                            controller.appointMentListToday.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        controller.appointMentListToday.length,
                                        (index) {
                                      var data = controller
                                          .appointMentListToday[index];
                                      return CustomDoctorCard(
                                        imageUrl: '',
                                        patentName: data.userId?.name ?? '',
                                        time: 'Today (${data.time ?? ''})',
                                        loacation: data.appointmentType ?? '',
                                        onTap: () => Get.toNamed(
                                            AppRoutes.patientDetails,
                                            arguments: data),
                                        reScheduleButton: () {
                                          Navigator.pop(context);
                                          controller.showHomePopup(
                                              id: data.id.toString());
                                        },
                                        timeTextColor: AppColors.blackO,
                                        videoCallOrConsaltentDoneButton: () {
                                          print(data.time);
                                        },
                                        typeOnline: data.appointmentType == null
                                            ? null
                                            : data.appointmentType! ==
                                                    AppStrings.online
                                                ? true
                                                : false,
                                        showVideoCallOrConsalttentButton:
                                            DateConverter
                                                .isWithin30MinutesOfTime(
                                                    data.time ?? ''),
                                      );
                                    }),
                                  )
                                : const Center(
                                    child: CustomText(
                                      text: 'Appointment Not Available',
                                    ),
                                  ),
                        //======================= Weekly List =====================
                        if (controller.scheduleTime.value ==
                                AppStrings.weekly &&
                            controller.tabSelectedIndex.value == 0)
                          controller.appointMentListWeekly.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      controller.appointMentListWeekly.length,
                                      (index) {
                                    var data =
                                        controller.appointMentListWeekly[index];
                                    return CustomDoctorCard(
                                      imageUrl: '',
                                      patentName: data.userId?.name ?? '',
                                      time:
                                          "${"${data.date?.day ?? ''}-${data.date?.month ?? ''}-${data.date?.year ?? ''}"}(${data.time ?? ''})",
                                      loacation: data.appointmentType ?? '',
                                      onTap: () => Get.toNamed(
                                          AppRoutes.patientDetails,
                                          arguments: data),
                                      reScheduleButton: () =>
                                          controller.showHomePopup(
                                              id: data.id.toString()),
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
                        if (controller.scheduleTime.value ==
                                AppStrings.monthly &&
                            controller.tabSelectedIndex.value == 0)
                          controller.appointMentListMonthly.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                      controller.appointMentListMonthly.length,
                                      (index) {
                                    var data = controller
                                        .appointMentListMonthly[index];
                                    return CustomDoctorCard(
                                      imageUrl: '',
                                      patentName: data.userId?.name ?? '',
                                      time:
                                          "${"${data.date?.day ?? ''}-${data.date?.month ?? ''}-${data.date?.year ?? ''}"}(${data.time ?? ''})",
                                      loacation: data.appointmentType ?? '',
                                      onTap: () => Get.toNamed(
                                          AppRoutes.patientDetails,
                                          arguments: data),
                                      reScheduleButton: () =>
                                          controller.showHomePopup(
                                              id: data.id.toString()),
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
                                  var data =
                                      controller.appointMentCalcelList[index];
                                  return CustomDoctorCard(
                                    imageUrl: '',
                                    patentName: data.userId?.name ?? '',
                                    time: data.time ?? '',
                                    loacation: data.appointmentType ?? '',
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
                    controller.getAllDoctorAppointment();
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
                    controller.getAllDoctorAppointmentWeeklyAndMonthy(
                        AppStrings.weekly);
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
                    controller.getAllDoctorAppointmentWeeklyAndMonthy(
                        AppStrings.monthly);
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
}
