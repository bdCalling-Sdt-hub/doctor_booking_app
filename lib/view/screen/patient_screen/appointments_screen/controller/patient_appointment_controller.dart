import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/appointment_screen_popup/appointment_cancel_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientAppointmentController extends GetxController {
  Rx<TextEditingController> resonOfVisitController =
      TextEditingController().obs;

  Rx<TextEditingController> describePbmController = TextEditingController().obs;

  GeneralController generalController = Get.find<GeneralController>();

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

  ///======================== Book Appoinment =======================
  RxString selectedDay = "".obs;
  RxString selectedTime = "".obs;
  RxString selectedDate = "".obs;
  //RxString appointmentType = "".obs;

  bookAppoinment(
      {required String doctorID, required String availableFor}) async {
    generalController.showPopUpLoader();

    Map<String, String> body = {
      "desc": describePbmController.value.text,
      "reason": resonOfVisitController.value.text,
      "day": selectedDay.value,
      "time": selectedTime.value,
      "date": selectedDate.value,
      "appointment_type": availableFor
    };

    List<MultipartBody>? multipartBody = [];

    for (int i = 0; i < generalController.selectedImagesMulti.length; i++) {
      multipartBody.add(MultipartBody(
          "prescription", generalController.selectedImagesMulti[i]));
    }

    var response = generalController.selectedImagesMulti.isEmpty
        ? await ApiClient.postData(
            ApiUrl.bookAppoinment(docId: doctorID),
            jsonEncode(body),
          )
        : await ApiClient.postMultipartData(
            ApiUrl.bookAppoinment(docId: doctorID), body,
            multipartBody: multipartBody);

    if (response.statusCode == 200) {
      toastMessage(
          message: "Appointment Request Send Successfully",
          colors: Colors.green);
      navigator?.pop();
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }
}
