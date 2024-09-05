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
  List<String> tabs = [AppStrings.schedule, AppStrings.cancel];
  RxInt tabSelectedIndex = RxInt(0);

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

  //======================= Get doctor appointment list Today ==============

  // RxList<AppointmentModel> appointMentList = <AppointmentModel>[].obs;
  RxList<AppointmentModel> appointMentListToday = <AppointmentModel>[].obs;

  getAllDoctorAppointment() async {
    var response =
        await ApiClient.getData("${ApiUrl.doctorAppointment}?type=today");

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      appointMentListToday.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  //==================== Get Doctor appoint ment weekly and monthly ======================//
  RxList<AppointmentModel> appointMentListWeekly = <AppointmentModel>[].obs;
  RxList<AppointmentModel> appointMentListMonthly = <AppointmentModel>[].obs;

  getAllDoctorAppointmentWeeklyAndMonthy(String type) async {
    if (type == AppStrings.weekly) {
      var response =
          await ApiClient.getData("${ApiUrl.doctorAppointment}?type=weekly");
      if (response.statusCode == 200) {
        setRxRequestStatus(Status.completed);
        // appointMentList.add(AppointmentModel.fromJson(response.body['data']));

        appointMentListWeekly.value = List<AppointmentModel>.from(
            response.body["data"].map((x) => AppointmentModel.fromJson(x)));
      } else {
        if (response.statusText == ApiClient.somethingWentWrong) {
          setRxRequestStatus(Status.internetError);
        } else {
          setRxRequestStatus(Status.error);
        }
        ApiChecker.checkApi(response);
      }
    } else {
      var response =
          await ApiClient.getData("${ApiUrl.doctorAppointment}?type=monthly");
      if (response.statusCode == 200) {
        setRxRequestStatus(Status.completed);
        // appointMentList.add(AppointmentModel.fromJson(response.body['data']));

        appointMentListMonthly.value = List<AppointmentModel>.from(
            response.body["data"].map((x) => AppointmentModel.fromJson(x)));
      } else {
        if (response.statusText == ApiClient.somethingWentWrong) {
          setRxRequestStatus(Status.internetError);
        } else {
          setRxRequestStatus(Status.error);
        }
        ApiChecker.checkApi(response);
      }
    }
  }

//============================ Appointments cancel list =======================//
  RxList<AppointmentModel> appointMentCalcelList = <AppointmentModel>[].obs;

  getAllDoctorAppointmentCencel() async {
    var response =
        await ApiClient.getData("${ApiUrl.doctorAppointment}?status=rejected");

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      appointMentCalcelList.value = List<AppointmentModel>.from(
          response.body["data"].map((x) => AppointmentModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
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
  RxString doctorRescheduleDay = 'Sunday'.obs;
  RxString doctorRescheduleTime = ''.obs;
  RxBool rescheduleLoading = false.obs;

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
        "date": doctorRescheduleDate.value,
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

  allMethod() {
    getDoctorOverview();
    getAllDoctorAppointment();
    getAllDoctorAppointmentCencel();
  }

  @override
  void onInit() {
    getDoctorOverview();
    getAllDoctorAppointment();
    getAllDoctorAppointmentCencel();
    super.onInit();
  }
}
