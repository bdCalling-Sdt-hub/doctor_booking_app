import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_notification_screen/doctor_notification_popup/doctor_notification_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final List<Map<String, dynamic>> notificationList = [
    {
      "title": "Appointment Success!",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventAvailable
    },
    {
      "title": "Appointment Remainder",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.calendarClock
    },
    {
      "title": "Appointment Canceled",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventBusy
    },
    {
      "title": "Payment Successful!",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.payments
    },
    {
      "title": "Schedule Changed",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventRepeat
    },
    {
      "title": "Share Your Experience ",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.review
    },
  ];
  //=================== Doctor Notification controller ===================//

  showNotificationPopup() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.whiteNormal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        content: const DoctorNotificationPopup(),
      ),
    );
  }

  ///======================== Doctor Notification Controller =============================//

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  getAllDoctorNotification() async {
//  getDoctorProfile() async {
//     setRxRequestStatus(Status.loading);
//     var response = await ApiClient.getData();

//     if (response.statusCode == 200) {
//       setRxRequestStatus(Status.completed);

//     } else {
//       if (response.statusText == ApiClient.noInternetMessage) {
//         setRxRequestStatus(Status.internetError);
//       } else {
//         setRxRequestStatus(Status.error);
//       }
//       ApiChecker.checkApi(response);
//     }
//   }
  }
}
