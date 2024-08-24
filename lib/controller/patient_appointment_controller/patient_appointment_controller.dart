import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/appointment_screen_popup/appointment_cancel_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientAppointmentController extends GetxController {
  ///=======================List============
  final List<String> userList = [
    AppStrings.upcoming,
    AppStrings.past,
    AppStrings.canceled,
  ];
  RxInt selectedIndex = 0.obs;
  //============================ Appointment screen more popup buton item list =========================

  List<String> moreButtonList = [AppStrings.reschedule, AppStrings.cancel];

  ///============================== Appointment Screen pop up ======================//

  appointmentCancelPopup() {
    return showDialog(
        context: Get.context!,
        builder: (_) => const AlertDialog(
              backgroundColor: AppColors.whiteNormal,
              content: AppointmentCancelPopup(),
            ));
  }
}
