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
  //============================> Tab selector item list =========================
  List<String> scheduleTabs = [
    AppStrings.upcoming,
    AppStrings.pendingCapital,
    AppStrings.pastCapital,
  ];
  //============================> appoinmentStatus item list =========================
  final List<String> appoinmentStatus = [
    AppStrings.accepted,
    AppStrings.pending,
    AppStrings.past,
    //  AppStrings.completed,
    //   AppStrings.rejected,
  ];
  RxInt tabCurrentIndex = 0.obs;
  // RxInt selectedIndex =    tabCurrentIndex.value.obs;
//=======================================> Show Rejected Popup ===========================>//
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

  //=======================================> Get Appoinment ===========================>//

  RxList<AppointmentModel> appointmentList = <AppointmentModel>[].obs;
  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;

  Future<void> getDoctorAppointment(String status) async {
    appointmentList.value = [];
    setRxRequestStatus(Status.loading);
    var response = tabCurrentIndex.value == 2
        ? await ApiClient.getData(ApiUrl.getAppointmentPast(type: status))
        : await ApiClient.getData(ApiUrl.getAppoinments(status: status));
    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      appointmentList.value = List<AppointmentModel>.from(
        response.body["data"].map(
          (x) => AppointmentModel.fromJson(x),
        ),
      );
      currentPage.value = response.body['pagination']['currentPage'];
      totalPage.value = response.body['pagination']['totalPages'];
      pageInit();
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  RxBool isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  pageInit() {
    page.value = currentPage.value;
    refresh();
  }
//======================== Get More Appoinment With Pagination =======================

  Future<void> loadMoreAppointment() async {
    if (isLoadMoreRunning.value == false &&
        currentPage.value != totalPage.value &&
        totalPage.value != 1 &&
        rxRequestStatus.value != Status.loading) {
      isLoadMoreRunning(true);
      page.value += 1;

      debugPrint(
          "===========================> page increment ${page.value} <===========================");
      debugPrint(
          "===========================> Total Page ${totalPage.value} <===========================");
      debugPrint(
          "===========================> currentPage ${currentPage.value} <===========================");
      var response = tabCurrentIndex.value == 2
          ? await ApiClient.getData(ApiUrl.getAppointmentPast(
              type: appoinmentStatus[tabCurrentIndex.value],
              page: page.value.toString()))
          : await ApiClient.getData(ApiUrl.getAppoinments(
              status: appoinmentStatus[tabCurrentIndex.value],
              page: page.value.toString()));
      if (response.statusCode == 200) {
        var demoList = List<AppointmentModel>.from(
          response.body["data"].map(
            (x) => AppointmentModel.fromJson(x),
          ),
        );
        appointmentList.addAll(demoList);
        appointmentList.refresh();
        currentPage.value = response.body['pagination']['currentPage'];
        totalPage.value = response.body['pagination']['totalPages'];
        isLoadMoreRunning(false);
      } else {
        ApiChecker.checkApi(response);
        isLoadMoreRunning(false);
      }
    }
  }

  Rx<ScrollController> scrollController = ScrollController().obs;

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //======================= Add Scroll Listener ====================================
  Future<void> addScrollListener() async {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        loadMoreAppointment();
      }
    });
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
      getDoctorAppointment(appoinmentStatus[tabCurrentIndex.value]);
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      debugPrint(
          "==============================${response.statusCode}====================");
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

//======================= Refresh Screen ====================================

  refreshScreen(int index) {
    switch (index) {
      case 0:
        return getDoctorAppointment(AppStrings.accepted);
      case 1:
        return getDoctorAppointment(AppStrings.pending);
      case 2:
        return getDoctorAppointment(AppStrings.past);
    }
  }

  @override
  void onInit() {
    getDoctorAppointment(AppStrings.accepted);
    scrollController.value.addListener(addScrollListener);
    super.onInit();
  }
}
