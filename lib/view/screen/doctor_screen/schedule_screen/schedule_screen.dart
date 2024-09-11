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
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:doctor_booking/view/widgets/video_call/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h),
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
          if (value == 0) {
            scheduleController.getAllDoctorAcceptAppointment();
          } else if (value == 1) {
            scheduleController.getPendingDoctorAppointment();
          } else {
            scheduleController.getPastDoctorAppointment();
          }
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
    return scheduleController.acceptAppointMentList.isNotEmpty
        ? Column(
            children: List.generate(
              scheduleController.acceptAppointMentList.length,
              (index) {
                AppointmentModel model =
                    scheduleController.acceptAppointMentList[index];

                return CustomDoctorCard(
                  imageUrl: "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                  patentName: model.userId?.name ?? '',
                  time:
                      "${DateConverter.formatDate(model.date ?? '')}(${model.time})",
                  loacation: model.userId?.location ?? '',
                  onTap: () {
                    debugPrint(
                        "Doctor ID>>>>${model.doctorId} || Doctor name>>>>${profileController.profileModel.value.name} || Call ID ${model.id}");
                    Get.to(() => AudioVideoCall(
                          userID: model.doctorId ?? "",
                          userName:
                              profileController.profileModel.value.name ?? "",
                          callID: model.id ?? "",
                        ));
                  },
                );
              },
            ),
          )
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }

  /// Builds the list of pending appointments
  Widget _buildPendingAppointments() {
    return scheduleController.pendingAppointmentList.isNotEmpty
        ? PendingScreen()
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }

  /// Builds the list of past appointments
  Widget _buildPastAppointments(context) {
    return scheduleController.pastAppointment.isNotEmpty
        ? Column(
            children: List.generate(
              scheduleController.pastAppointment.length,
              (index) {
                AppointmentModel model =
                    scheduleController.pastAppointment[index];
                return CustomDoctorCard(
                  imageUrl: "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                  patentName: model.userId?.name ?? '',
                  time:
                      "${DateConverter.formatDate(model.date ?? '')}(${model.time})",
                  loacation: model.userId?.location ?? '',
                  onTap: () {},
                  showPopupButton: true,
                  reScheduleButton: () {
                    if (model.id != null) {
                      Navigator.pop(context);
                      homeController.showHomePopup(id: model.id!);
                    }
                  },
                );
              },
            ),
          )
        : const Center(child: CustomText(text: 'Appointment Not Available'));
  }
}
