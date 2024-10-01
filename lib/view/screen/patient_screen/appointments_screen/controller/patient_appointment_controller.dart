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
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/appointments_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/model/appoinment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientAppointmentController extends GetxController
    with GetxServiceMixin {
  Rx<TextEditingController> resonOfVisitController =
      TextEditingController().obs;

  Rx<TextEditingController> describePbmController = TextEditingController().obs;
  GeneralController generalController = Get.find<GeneralController>();

  Rx<Status> appoinmentLoading = Status.loading.obs;
  void appoinmentLoadingMethod({required Status status}) =>
      appoinmentLoading = status.obs;

  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;

  ///=======================List============
  final List<String> tapBarItems = [
    AppStrings.pendingCapital,
    AppStrings.upcoming,
    //AppStrings.completed,
    AppStrings.canceled,
  ];

  final List<String> appoinmentStatus = [
    AppStrings.pending,
    AppStrings.accepted,
    //AppStrings.completed,
    AppStrings.rejected,
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

    debugPrint("Available For ===============>>>>>>>>> $availableFor");

    Map<String, String> body = {
      "desc": describePbmController.value.text,
      "reason": resonOfVisitController.value.text,
      "day": selectedDay.value,
      "time": selectedTime.value,
      "date": selectedDate.value,
      "appointment_type": availableFor == AppStrings.online
          ? AppStrings.onlineCapital
          : availableFor == AppStrings.inPerson
              ? AppStrings.offlineCapital
              : AppStrings.weekendCapital
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

      getMyAppoinment(status: AppStrings.pending);

      Get.offAll(() => AppointmentsScreen());
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  ///======================== Get My Appoinments =======================
  RxList<AppoinmentListModel> appoinmentList = <AppoinmentListModel>[].obs;
  RxList<AppoinmentListModel> appoinmentHistory = <AppoinmentListModel>[].obs;

  getMyAppoinment({required String status, bool isHistory = false}) async {
    appoinmentList.value = [];
    appoinmentLoadingMethod(status: Status.loading);
    refresh();
    var response =
        await ApiClient.getData(ApiUrl.getAppoinments(status: status));

    if (response.statusCode == 200) {
      appoinmentList.value = List<AppoinmentListModel>.from(
          response.body["data"].map((x) => AppoinmentListModel.fromJson(x)));

      if (isHistory) {
        appoinmentHistory.value = List<AppoinmentListModel>.from(
            response.body["data"].map((x) => AppoinmentListModel.fromJson(x)));
      }

      currentPage.value = response.body['pagination']['currentPage'];
      totalPage.value = response.body['pagination']['totalPages'];
      appoinmentLoadingMethod(status: Status.completed);
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        appoinmentLoadingMethod(status: Status.internetError);
      } else {
        appoinmentLoadingMethod(status: Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///========================= Get More Appoinment With Pagination ========================
  Rx<ScrollController> scrollController = ScrollController().obs;
  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMoreAppoinments() async {
    debugPrint("============== Load More Appoinment ================");
    if (appoinmentLoading.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(ApiUrl.getAppoinments(
          status: appoinmentStatus[selectedIndex.value],
          page: page.value.toString()));

      currentPage.value = response.body['pagination']['currentPage'];
      totalPage.value = response.body['pagination']['totalPages'];

      if (response.statusCode == 200) {
        var demoList = List<AppoinmentListModel>.from(
            response.body["data"].map((x) => AppoinmentListModel.fromJson(x)));
        appoinmentList.addAll(demoList);
        appoinmentList.refresh();
        refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        loadMoreAppoinments();
      }
    });
  }

//===================== Refresh =====================

  refreshScreen({required int index}) {
    switch (index) {
      case 0:
        // ignore: void_checks
        return getMyAppoinment(status: AppStrings.pending);
      case 1:
        // ignore: void_checks
        return getMyAppoinment(status: AppStrings.accepted);

      case 2:
        // ignore: void_checks
        return getMyAppoinment(status: AppStrings.rejected);
    }
  }

//===================== Give Ratting =====================
  RxDouble rattingvalue = 5.0.obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;

  makeRatting({required String docID, required String appointmentId}) async {
    generalController.showPopUpLoader();

    Map<String, dynamic> body = {
      "receiver": docID,
      "rating": rattingvalue.value,
      "comment": commentController.value.text,
      "appointmentId": appointmentId
    };

    var response =
        await ApiClient.postData(ApiUrl.giveRatting, jsonEncode(body));

    if (response.statusCode == 200) {
      navigator?.pop();
      navigator?.pop();
      toastMessage(message: response.body["message"], colors: Colors.green);
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getMyAppoinment(status: AppStrings.pending);
    getMyAppoinment(status: AppStrings.completed, isHistory: true);
    scrollController.value.addListener(addScrollListener);
    super.onInit();
  }
}
