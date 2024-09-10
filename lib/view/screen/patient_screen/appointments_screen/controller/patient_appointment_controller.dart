import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/appointment_screen_popup/appointment_cancel_popup.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/model/appoinment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientAppointmentController extends GetxController {
  Rx<TextEditingController> resonOfVisitController =
      TextEditingController().obs;

  Rx<TextEditingController> describePbmController = TextEditingController().obs;
  GeneralController generalController = Get.find<GeneralController>();

  Rx<Status> appoinmentLoading = Status.loading.obs;
  void appoinmentLoadingMethod({required Status status}) =>
      appoinmentLoading = status.obs;

  ///=======================List============
  final List<String> userList = [
    //AppStrings.pendingCapital,
    AppStrings.upcoming,
    AppStrings.past,
    AppStrings.canceled,
  ];
  RxInt selectedIndex = 0.obs;
  //============================ Appointment screen more popup buton item list =========================

  List<String> moreButtonList = [AppStrings.reschedule, AppStrings.cancel];
  List<String> cancelButton = [AppStrings.cancel];

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
      navigator?.pop();
      toastMessage(
          message: "Appointment Request Send Successfully",
          colors: Colors.green);
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  ///======================== Get My Appoinments =======================
  RxList<AppoinmentListModel> appoinmentList = <AppoinmentListModel>[].obs;

  getMyAppoinment({required String status}) async {
    appoinmentList.value = [];
    appoinmentLoadingMethod(status: Status.loading);
    refresh();
    var response =
        await ApiClient.getData(ApiUrl.getAppoinments(status: status));

    appoinmentList.value = List<AppoinmentListModel>.from(
        response.body["data"].map((x) => AppoinmentListModel.fromJson(x)));

    if (response.statusCode == 200) {
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        appoinmentLoadingMethod(status: Status.internetError);
      } else {
        appoinmentLoadingMethod(status: Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getMyAppoinment(status: AppStrings.accepted);
    super.onInit();
  }
}
