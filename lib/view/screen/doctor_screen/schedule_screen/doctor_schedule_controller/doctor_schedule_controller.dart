import 'dart:convert';

import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/schedule_rejected_popup/schedule_rejected_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScheduleController extends GetxController {
  List<String> scheduleTabs = [
    AppStrings.upcoming,
    AppStrings.pending,
    AppStrings.past,
  ];

  showRejectedPopup({required String id}) {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.whiteNormal,
        content: ScheduleRejectedPopup(
          appointmentId: id,
        ),
      ),
    );
  }

  RxInt tabCurrentIndex = RxInt(0);
//=========================== Get All Appoinment =========================//
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  RxList<AppointmentModel> acceptAppointMentList = <AppointmentModel>[].obs;

  getAllDoctorAppointment() async {
    var response =
        await ApiClient.getData("${ApiUrl.doctorAppointment}?status=accepted");

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      acceptAppointMentList.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
  //==================================== Pending Appointment ===========================//     ?status=pending

  final String pendingAppointmentUrl =
      "${ApiUrl.doctorAppointment}?status=pending";

  RxList<AppointmentModel> pendingAppointmentList = <AppointmentModel>[].obs;

  Future<void> getPendingDoctorAppointment() async {
    var response = await ApiClient.getData(pendingAppointmentUrl);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      pendingAppointmentList.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
  //============================== Past Appointment ===============================//

  final String pastAppointmentUrl = "${ApiUrl.doctorAppointment}?type=past";
  RxList<AppointmentModel> pastAppointment = <AppointmentModel>[].obs;

  Future<void> getPastDoctorAppointment() async {
    var response = await ApiClient.getData(pastAppointmentUrl);

    if (response.statusCode == 200) {
      pastAppointment.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  //====================================== Appointment status updated ====================================//

  Future<void> appointmentStatusUpdate(
      {required String status, required String appointmentId}) async {
    Map<String, String> body = {
      "status": status,
    };

    var response = await ApiClient.patchData(
        "${ApiUrl.appointmentUpdateStatus}$appointmentId", jsonEncode(body));
    if (response.statusCode == 200) {
      getPendingDoctorAppointment();
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      debugPrint(
          "==============================${response.statusCode}====================");
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getAllDoctorAppointment();
    getPendingDoctorAppointment();
    getPastDoctorAppointment();
    super.onInit();
  }
}
