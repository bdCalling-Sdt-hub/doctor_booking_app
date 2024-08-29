import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';

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
        backgroundColor: AppColors.whiteNormal,
        content: DoctorHomePopup(),
      ),
    );
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //======================= Get doctor appointment list ==============

  RxList<AppointmentModel> appointMentList = <AppointmentModel>[].obs;

  getAllDoctorAppointment() async {
    var response = await ApiClient.getData(ApiUrl.doctorAppointment);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      // appointMentList.add(AppointmentModel.fromJson(response.body['data']));

      appointMentList.value = List<AppointmentModel>.from(
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

  getAllDoctorAppointmentWeeklyAndMonthy(String type) async {
    if (type == AppStrings.weekly) {
      var response =
          await ApiClient.getData("${ApiUrl.doctorAppointment}?type=weekly");
      if (response.statusCode == 200) {
        setRxRequestStatus(Status.completed);
        // appointMentList.add(AppointmentModel.fromJson(response.body['data']));

        appointMentList.value = List<AppointmentModel>.from(
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

        appointMentList.value = List<AppointmentModel>.from(
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

  allMethod() {
    getAllDoctorAppointment();
  }

  @override
  void onInit() {
    getAllDoctorAppointment();
    super.onInit();
  }
}
