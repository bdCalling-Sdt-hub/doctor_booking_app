import 'dart:convert';

import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/model/doctor_overview_model/doctor_overview_model.dart';

import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/doctor_home_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorHomeController extends GetxController {
  RxString scheduleTime = RxString(AppStrings.today);

  // final RxList<String> scheduleOrCancel = [
  //   AppStrings.schedule,
  //   AppStrings.cancel
  // ];

  RxInt popupAvailableTimeCurrentIndex = 0.obs;
  RxInt popupReschuduleCurrentIndex = RxInt(0);
  RxInt selectedIndex = RxInt(0);
//========================= Home Tab List =====================
  List<String> tabs = [
    AppStrings.schedule,
    AppStrings.completed2,
    AppStrings.cancel
  ];
  //========================= Home Status List =====================
  List<String> appointmentStatusList = [
    AppStrings.accepted,
    AppStrings.completed,
    AppStrings.rejected
  ];

  RxString setType = AppStrings.todaySmall.obs;

  RxInt tabSelectedIndex = 0.obs;

  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;

  showHomePopup({required String id}) {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.whiteNormal,
        content: DoctorHomePopup(
          id: id,
        ),
      ),
    );
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //======================== Get All Appointment ======================//

  RxList<AppointmentModel> appointMentList = <AppointmentModel>[].obs;

  Future<void> getAllDoctorAppointment(
      {required String status, String type = AppStrings.todaySmall}) async {
    appointMentList.value = [];

    var response = tabSelectedIndex.value == 0
        ? await ApiClient.getData(ApiUrl.getAppointmentType(type: type))
        : await ApiClient.getData(ApiUrl.getAppoinments(status: status));
    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      appointMentList.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
      totalPage.value = response.body['pagination']['totalPages'];
      currentPage.value = response.body['pagination']['currentPage'];
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
  }

  //======================== Get More Appoinment With Pagination =======================
  Rx<ScrollController> homescrollControloler = ScrollController().obs;
  Future<void> loadMoreAppointment() async {
    if (isLoadMoreRunning.value == false &&
        totalPage.value != 1 &&
        totalPage.value != currentPage.value &&
        rxRequestStatus.value != Status.loading) {
      page.value += 1;

      isLoadMoreRunning(true);

      var response = tabSelectedIndex.value == 0
          ? await ApiClient.getData(ApiUrl.getAppointmentType(
              type: setType.value, page: page.value.toString()))
          : await ApiClient.getData(ApiUrl.getAppoinments(
              status: appointmentStatusList[tabSelectedIndex.value],
              page: page.value.toString()));

      if (response.statusCode == 200) {
        setRxRequestStatus(Status.completed);
        appointMentList.addAll(
          List<AppointmentModel>.from(
              response.body["data"].map((x) => AppointmentModel.fromJson(x))),
        );
        totalPage.value = response.body["totalPages"];
        currentPage.value = response.body["currentPage"];
        pageInit();
        refresh();
        isLoadMoreRunning(false);
      } else {
        if (response.statusText == ApiClient.somethingWentWrong) {
          setRxRequestStatus(Status.internetError);
          isLoadMoreRunning(false);
        } else {
          setRxRequestStatus(Status.error);
          isLoadMoreRunning(false);
        }
        ApiChecker.checkApi(response);
        isLoadMoreRunning(false);
      }
    }
  }

  refreshScreen(int index) {
    getDoctorOverview();
    switch (index) {
      case 0:
        return typeRefresh();
      case 1:
        getAllDoctorAppointment(status: AppStrings.completed);
      case 2:
        getAllDoctorAppointment(status: AppStrings.rejected);
    }
  }

  typeRefresh() {
    switch (setType) {
      // ignore: constant_pattern_never_matches_value_type
      case AppStrings.todaySmall:
        return getAllDoctorAppointment(
            status: AppStrings.accepted, type: AppStrings.todaySmall);
      // ignore: constant_pattern_never_matches_value_type
      case AppStrings.weeklySmall:
        return getAllDoctorAppointment(
            status: AppStrings.accepted, type: AppStrings.weeklySmall);
      // ignore: constant_pattern_never_matches_value_type
      case AppStrings.monthlySmall:
        return getAllDoctorAppointment(
            status: AppStrings.accepted, type: AppStrings.monthlySmall);
    }
  }

  Future<void> addScrollListener() async {
    homescrollControloler.value.addListener(() {
      if (homescrollControloler.value.position.atEdge) {
        if (homescrollControloler.value.position.pixels != 0) {
          loadMoreAppointment();
        }
      }
    });
  }

  //========================================= Get doctor overview =========================///

  Rx<DoctorOverviewModel> doctorOverview = DoctorOverviewModel().obs;

  Future<void> getDoctorOverview() async {
    var response = await ApiClient.getData(ApiUrl.doctorOverveiw);
    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      doctorOverview.value =
          DoctorOverviewModel.fromJson(response.body['data']);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

//============================== Resudule Appointment ======================//

  Rx<TextEditingController> appointmentRescheduleNote =
      TextEditingController().obs;
  RxString doctorRescheduleDate = ''.obs;
  RxString doctorRescheduleMonth = ''.obs;
  RxString doctorRescheduleYear = ''.obs;

  RxString doctorRescheduleDay = 'Sunday'.obs;
  RxString doctorRescheduleTime = ''.obs;
  RxBool rescheduleLoading = false.obs;

  //================= Set Date Month Year ==========================//
  initRescheduleDateMonthYaer(DateTime dateTime) {
    doctorRescheduleDate.value = DateFormat('d').format(dateTime).toLowerCase();
    doctorRescheduleMonth.value =
        DateFormat('M').format(dateTime).toLowerCase();
    doctorRescheduleYear.value = DateFormat('y').format(dateTime).toLowerCase();

    debugPrint(
        "==================================== ${doctorRescheduleDate.value}-${doctorRescheduleMonth.value}-${doctorRescheduleYear.value}");
    refresh();
  }

  Future<void> doctorRescheduleAppointment(
      {required String appointmentId}) async {
    if (doctorRescheduleDate.value.isNotEmpty &&
        doctorRescheduleDay.value.isNotEmpty &&
        doctorRescheduleTime.value.isNotEmpty) {
      RxBool updatePersonalLoading = false.obs;
      String id = await SharePrefsHelper.getString(AppConstants.id);

      updatePersonalLoading.value = true;
      debugPrint("=====================$appointmentId=====================");
      refresh();
      Map<String, String> body = {
        "day": doctorRescheduleDay.value,
        "time": doctorRescheduleTime.value,
        "date":
            "${doctorRescheduleDate.value}-${doctorRescheduleMonth.value}-${doctorRescheduleYear.value}",
        "notes": appointmentRescheduleNote.value.text,
        "appointmentId": appointmentId,
      };

      debugPrint(
          "======Appointment Id ========================$appointmentId============================");

      var response = await ApiClient.patchData(
          "${ApiUrl.updateAppointment}$id", jsonEncode(body));

      if (response.statusCode == 200) {
        updatePersonalLoading.value = false;

        Navigator.pop(Get.context!);
        refresh();
        showCustomSnackBar(
          response.body['message'],
          getXSnackBar: false,
          isError: false,
        );

        Get.back();
      } else {
        updatePersonalLoading.value = false;
        refresh();
        if (response.statusText == ApiClient.somethingWentWrong) {
        } else {}
        updatePersonalLoading.value = false;
        refresh();
        ApiChecker.checkApi(response);
      }
    }
  }

 

  @override
  void onInit() {
    homescrollControloler.value.addListener(addScrollListener);
    getAllDoctorAppointment(status: AppStrings.accepted);
    getDoctorOverview();
    super.onInit();
  }
}
