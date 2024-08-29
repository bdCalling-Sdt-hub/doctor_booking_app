import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/model/doctor_overview_model/doctor_overview_model.dart';

import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
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

  RxInt popupAvailableTimeCurrentIndex = RxInt(0);
  RxInt popupReschuduleCurrentIndex = RxInt(0);
  RxInt selectedIndex = RxInt(0);

  List<String> tabs = [AppStrings.schedule, AppStrings.cancel];
  RxInt tabSelectedIndex = RxInt(0);

  showHomePopup() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: AppColors.whiteNormal,
        content: DoctorHomePopup(),
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
      if (response.statusText == ApiClient.noInternetMessage) {
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
        if (response.statusText == ApiClient.noInternetMessage) {
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
        if (response.statusText == ApiClient.noInternetMessage) {
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
      if (response.statusText == ApiClient.noInternetMessage) {
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
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
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
