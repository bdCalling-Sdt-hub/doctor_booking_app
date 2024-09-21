import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/pending_screen/pending_screen.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../helper/time_converter/time_converter.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  final DoctorScheduleController scheduleController =
      Get.find<DoctorScheduleController>();
  final DoctorHomeController homeController = Get.find<DoctorHomeController>();

  final DoctorProfileController profileController =
      Get.find<DoctorProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 1),

      /// AppBar with title
      appBar: const CustomAppBar(
        appBarContent: AppStrings.schedule,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h),
        child: RefreshIndicator(
          backgroundColor: AppColors.blackNormal,
          color: AppColors.white,
          onRefresh: () => scheduleController
              .refreshScreen(scheduleController.tabCurrentIndex.value),
          child: Column(
            children: [
              _buildTabSelector(),
              SizedBox(height: 25.h),
              _buildAppointmentList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the tab selector widget
  Widget _buildTabSelector() {
    final DoctorScheduleController scheduleController =
        Get.find<DoctorScheduleController>();
    return Obx(() {
      return CustomTabSelector(
        tabs: scheduleController.scheduleTabs,
        selectedIndex: scheduleController.tabCurrentIndex.value,
        onTabSelected: (value) {
          scheduleController.tabCurrentIndex.value = value;
          scheduleController.refreshScreen(value);
          scheduleController.tabCurrentIndex
              .refresh(); // Refresh the selected index
        },
        selectedColor: AppColors.grayNormal,
        unselectedColor: AppColors.grayLightHover,
        isTextColorActive: true,
        textColor: AppColors.grayNormal.withOpacity(.5),
      );
    });
  }

  /// Builds the appointment list based on the selected tab
  Widget _buildAppointmentList(context) {
    return Obx(() {
      if (scheduleController.tabCurrentIndex.value == 0) {
        return _buildAcceptedAppointments();
      } else if (scheduleController.tabCurrentIndex.value == 1) {
        return _buildPendingAppointments();
      } else {
        return _buildPastAppointments(context);
      }
    });
  }

  /// Builds the list of accepted appointments
  Widget _buildAcceptedAppointments() {
    return scheduleController.appointmentList.isNotEmpty
        ? Expanded(
            child: ListView.builder(
                controller: scheduleController.scrollController.value,
                itemCount: scheduleController.appointmentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  AppointmentModel model =
                      scheduleController.appointmentList[index];
                  if (scheduleController.isLoadMoreRunning.value == false) {
                    return CustomDoctorCard(
                      imageUrl: "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                      patentName: model.userId?.name ?? '',
                      time:
                          "${DateConverter.timeFormetString(model.date ?? "")}(${model.time})",
                      loacation: model.appointmentType ?? '',
                      onTap: () {
                        Get.toNamed(AppRoutes.patientDetails, arguments: model);
                      },
                      rescheduleButtonText: AppStrings.reject,
                      reScheduleButton: () {
                        Navigator.pop(context);
                        if (model.id != null) {
                          scheduleController.showRejectedPopup(id: model.id!);
                        }
                      },
                      showPaymentOption: true,
                      paymentStatus: model.paymentStatus,
                      showPopupButton: model.paymentStatus == null
                          ? false
                          : model.paymentStatus!
                              ? false
                              : true,
                    );
                  } else {
                    return const CustomLoader();
                  }
                }),
          )
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }

  /// Builds the list of pending appointments
  Widget _buildPendingAppointments() {
    return scheduleController.appointmentList.isNotEmpty
        ? PendingScreen()
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }

  /// Builds the list of past appointments
  Widget _buildPastAppointments(context) {
    return scheduleController.appointmentList.isNotEmpty
        ? Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                controller: scheduleController.scrollController.value,
                itemCount: scheduleController.appointmentList.length,
                itemBuilder: (context, index) {
                  final model = scheduleController.appointmentList[index];
                  if (scheduleController.isLoadMoreRunning.value == false) {
                    return CustomDoctorCard(
                      imageUrl: "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                      patentName: model.userId?.name ?? '',
                      time:
                          "${DateConverter.timeFormetString(model.date ?? "")}(${model.time})",
                      loacation: model.appointmentType ?? '',
                      onTap: () {},
                      showPopupButton: false,
                      reScheduleButton: () {
                        if (model.id != null) {
                          Navigator.pop(context);
                          homeController.showHomePopup(id: model.id!);
                        }
                      },
                    );
                  } else {
                    return const CustomLoader();
                  }
                }),
          )
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }
}
