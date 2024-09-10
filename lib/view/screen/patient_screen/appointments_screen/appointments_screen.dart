import 'package:doctor_booking/controller/payment_controller/payment_controller.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_appointment_card/custom_appointment_card.dart';
import 'package:doctor_booking/view/widgets/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:doctor_booking/view/widgets/custom_tab_selected/custom_tab_selected.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:doctor_booking/view/widgets/video_call/video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({super.key});

  final PatientAppointmentController patientAppointmentController =
      Get.find<PatientAppointmentController>();

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();

  final PaitentPaymentController paitentPaymentController =
      Get.find<PaitentPaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      // appBar: const CustomAppBar(
      //   appBarContent: AppStrings.appointments,
      // ),
      bottomNavigationBar: const PatientNavBar(currentIndex: 3),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () {
            return patientAppointmentController.getMyAppoinment(
                status: AppStrings.accepted);
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
            child: Column(
              children: [
                ///===========================3 Tab bar=======================
                CustomTabSelector(
                  tabs: patientAppointmentController.userList,
                  selectedIndex:
                      patientAppointmentController.selectedIndex.value,
                  onTabSelected: (index) {
                    patientAppointmentController.selectedIndex.value = index;
                    switch (patientAppointmentController.selectedIndex.value) {
                      case 0:
                        // ignore: void_checks
                        return patientAppointmentController.getMyAppoinment(
                            status: AppStrings.pending);
                      case 1:
                        // ignore: void_checks
                        return patientAppointmentController.getMyAppoinment(
                            status: AppStrings.accepted);

                      case 2:
                        // ignore: void_checks
                        return patientAppointmentController.getMyAppoinment(
                            status: AppStrings.completed);

                      case 3:
                        // ignore: void_checks
                        return patientAppointmentController.getMyAppoinment(
                            status: AppStrings.rejected);
                    }
                    // Handle any additional actions here if needed
                  },
                  selectedColor: AppColors.blackNormal,
                  unselectedColor: AppColors.whiteDarkHover,
                ),

                ///======================== Appoinments ==================

                Column(
                  children: List.generate(
                      patientAppointmentController.appoinmentList.length,
                      (index) {
                    var data =
                        patientAppointmentController.appoinmentList[index];
                    return CustomAppointmentCard(
                      appoinmentType: data.appointmentType ?? "",
                      appoinmentStatus: data.status ?? "",
                      paymentStatus: data.paymentStatus ?? false,
                      type: data.appointmentType ?? "",
                      imageUrl: AppConstants.userNtr,
                      name: data.name ?? "",
                      profession: data.doctorId?.specialization ?? "",
                      trailing: CustomPopupmenuButton(
                        onChanged: (value) {
                          if (value == AppStrings.reschedule) {
                            Get.toNamed(AppRoutes.rescheduleAppointmentScreen);
                          } else {
                            patientAppointmentController
                                .appointmentCancelPopup();
                          }
                        },
                        items: patientAppointmentController.moreButtonList,
                        icons: Icons.more_vert,
                      ),
                      onTap: () {
                        if (data.paymentStatus ?? false) {
                          debugPrint(
                              "User ID>>>>${data.userId} || User name>>>>${profileController.profileData.value.name} || Call ID>>>${data.id}");
                          Get.to(() => AudioVideoCall(
                                userID: data.userId ?? "",
                                userName:
                                    profileController.profileData.value.name ??
                                        "",
                                callID: data.id ?? "",
                              ));
                        } else {
                          ///============== TODO Change Ammount =============
                          paitentPaymentController.makePayment(
                              amount: 60,
                              userID: data.userId ?? "",
                              doctorID: data.doctorId?.id ?? "",
                              appoinmentId: data.id ?? "");
                        }
                      },
                      date: DateConverter.estimatedDate(
                          data.date ?? DateTime.now()),
                      time: data.time ?? "",
                      location: data.doctorId?.location ?? "",
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
