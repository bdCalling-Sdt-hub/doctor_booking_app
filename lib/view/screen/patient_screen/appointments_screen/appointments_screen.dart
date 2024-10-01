import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/controller/payment_controller/payment_controller.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/model/appoinment_list_model.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/view/widgets/custom_appointment_card/custom_appointment_card.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
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

  final GeneralController generalController = Get.find<GeneralController>();

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
            return patientAppointmentController.refreshScreen(
                index: patientAppointmentController.selectedIndex.value);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
            child: Column(
              children: [
                ///===========================3 Tab bar=======================
                CustomTabSelector(
                  tabs: patientAppointmentController.tapBarItems,
                  selectedIndex:
                      patientAppointmentController.selectedIndex.value,
                  onTabSelected: (index) {
                    patientAppointmentController.selectedIndex.value = index;
                    patientAppointmentController.refreshScreen(index: index);
                    patientAppointmentController.selectedIndex.refresh();
                    // Handle any additional actions here if needed
                  },
                  selectedColor: AppColors.blackNormal,
                  unselectedColor: AppColors.whiteDarkHover,
                ),

                ///======================== Appoinments ==================

                Expanded(
                  child: ListView.builder(
                    controller:
                        patientAppointmentController.scrollController.value,
                    itemCount:
                        patientAppointmentController.appoinmentList.length,
                    itemBuilder: (context, index) {
                      AppoinmentListModel data =
                          patientAppointmentController.appoinmentList[index];
                      if (patientAppointmentController
                              .isLoadMoreRunning.value ==
                          false) {
                        return CustomAppointmentCard(
                          note: data.notes ?? "Nothing",
                          doctorInfo: data.doctorId!,
                          reSchedule: data.reSchedule ?? false,
                          onTap2: () async {
                            bool complete =
                                await generalController.updateAppoinment(
                                    appoinmentID: data.id ?? "",
                                    status: AppStrings.accepted);
                            if (complete) {
                              patientAppointmentController.refreshScreen(
                                  index: index);
                            }

                            debugPrint("Reschedule Accept>>>>>>>>>>>>>>>");
                          },
                          appoinmentType: data.appointmentType ?? "",
                          appoinmentStatus: data.status ?? "",
                          paymentStatus: data.paymentStatus ?? false,
                          type: data.appointmentType == AppStrings.onlineCapital
                              ? AppStrings.online
                              : data.appointmentType ==
                                      AppStrings.offlineCapital
                                  ? AppStrings.inPerson
                                  : AppStrings.unavailable,
                          imageUrl:
                              "${ApiUrl.baseUrl}/${data.doctorId?.img ?? ""}",
                          name: data.name ?? "",
                          profession: data.doctorId?.specialization ?? "",
                          trailing: data.status == AppStrings.pending ||
                                  data.status == AppStrings.accepted
                              ? CustomPopupmenuButton(
                                  onChanged: (value) {
                                    if (value == AppStrings.reschedule) {
                                      Get.toNamed(AppRoutes
                                          .rescheduleAppointmentScreen);
                                    } else {
                                      patientAppointmentController
                                          .appointmentCancelPopup();
                                    }
                                  },
                                  items:
                                      patientAppointmentController.cancelButton,
                                  icons: Icons.more_vert,
                                )
                              : const SizedBox(),
                          onTap: () async {
                            if (data.paymentStatus ?? false) {
                              debugPrint(
                                  "User ID>>>>${data.userId} || User name>>>>${profileController.profileData.value.name} || Call ID>>>${data.id}");
                              Get.to(() => AudioVideoCall(
                                    receiverId: data.userId ?? "",
                                    senderID: data.doctorId?.id ?? "",
                                    userName: profileController
                                            .profileData.value.name ??
                                        "",
                                    callID: data.id ?? "",
                                  ));
                            } else if (data.reSchedule! &&
                                data.paymentStatus == false) {
                              bool complete =
                                  await generalController.updateAppoinment(
                                      appoinmentID: data.id ?? "",
                                      status: AppStrings.rejected);
                              if (complete) {
                                patientAppointmentController.refreshScreen(
                                    index: index);
                              }
                              debugPrint("Reschedule Reject>>>>>>>>>>>>>>>");
                            } else {
                              paitentPaymentController.makePayment(
                                  appoinmentDate: data.date ?? "",
                                  amount: 100,
                                  userID: data.userId ?? "",
                                  doctorID: data.doctorId?.id ?? "",
                                  appoinmentId: data.id ?? "");
                            }
                          },
                          date: DateConverter.timeFormetString(data.date ?? ""),
                          time: data.time ?? "",
                          location: data.doctorId?.location ?? "",
                        );
                      } else {
                        return const CustomLoader();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
