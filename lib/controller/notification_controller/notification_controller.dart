import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/model/doctor_notification_model/notification_model.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/service/socket_service.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_notification_screen/doctor_notification_popup/doctor_notification_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  GeneralController generalController = Get.find<GeneralController>();

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

  ///======================== Get Doctor Notification Method =============================//
  RxList<DoctorNotificationModel> doctorNotificationList =
      <DoctorNotificationModel>[].obs;

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  getAllDoctorNotification() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.doctorNotification);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      doctorNotificationList.value = List<DoctorNotificationModel>.from(response
          .body['data']
          .map((x) => DoctorNotificationModel.fromJson(x)));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///======================== Read All Notification =======================
  readAllNotification() async {
    generalController.showPopUpLoader();
    var response = await ApiClient.patchData(ApiUrl.readAllNotification, {},
        isContentType: false);
    if (response.statusCode == 200) {
      navigator?.pop();
      getAllDoctorNotification();
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  ///======================== Listen Socket Notification ======================
  listenNewNotification() {
    SocketApi.socket.on("new-notification", (value) {
      debugPrint("Notification Socket===========>>>>>>>>>>>>$value");

      Map<String, dynamic> getresponse = value;

      DoctorNotificationModel newNotification =
          DoctorNotificationModel.fromJson(getresponse);

      doctorNotificationList.insert(0, newNotification);
    });

    doctorNotificationList.refresh();
  }

  // listenNewNotificat() {
  //   SocketApi.socket.emitWithAck("new-notification::656587875875875875",
  //       (data) {
  //     debugPrint("Notification Socket===========>>>>>>>>>>>>$data");
  //   });

  //   doctorNotificationList.refresh();
  // }

  @override
  void onInit() {
    listenNewNotification();
    getAllDoctorNotification();
    super.onInit();
  }
}
