import 'package:doctor_booking/model/calls_history_model/calls_history_model.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/call_screen/call_popup/calls_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/api_check.dart';
import '../../service/api_client.dart';
import '../../utils/app_const/app_const.dart';

class CallsController extends GetxController {
  //===================== Call history remove popup =====================
  showCallsPopup() {
    return showDialog(
        barrierDismissible: true,
        context: Get.context!,
        builder: (_) {
          return const CallsPopup();
        });
  }

  List<String> callsTabList = [AppStrings.today, AppStrings.allCalls];
  RxInt callsTabIndex = 0.obs;

  //===================== Get call history =====================

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //======================== Get All Appointment ======================//

  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;

  RxList<DoctorCallHistoryModel> doctorCallHistoryList =
      <DoctorCallHistoryModel>[].obs;

  Future<void> getDoctorCallHistory() async {
    doctorCallHistoryList.value = [];

    var response = await ApiClient.getData(ApiUrl.getDoctorCallHistory());
    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      doctorCallHistoryList.value = List<DoctorCallHistoryModel>.from(
          response.body["data"].map((x) => DoctorCallHistoryModel.fromJson(x)));
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
    refresh();
  }

  Rx<ScrollController> callsScrollControloler = ScrollController().obs;
  Future<void> loadMoreDoctorCallHistory() async {
    if (isLoadMoreRunning.value == false &&
        totalPage.value != 1 &&
        totalPage.value != currentPage.value &&
        rxRequestStatus.value != Status.loading) {
      debugPrint(
          "=================Total Page ====================>{totalPage.value ${totalPage.value} ");
      debugPrint(
          "=================Current Page ====================>{currentPage.value ${currentPage.value} ");
      page.value += 1;

      isLoadMoreRunning(true);
      refresh();
      var response = await ApiClient.getData(
          ApiUrl.getDoctorCallHistory(page: page.value.toString()));

      if (response.statusCode == 200) {
        setRxRequestStatus(Status.completed);
        doctorCallHistoryList.addAll(
          List<DoctorCallHistoryModel>.from(response.body["data"]
              .map((x) => DoctorCallHistoryModel.fromJson(x))),
        );
        totalPage.value = response.body["totalPages"];
        currentPage.value = response.body["currentPage"];
        pageInit();
        isLoadMoreRunning(false);
        refresh();
      } else {
        if (response.statusText == ApiClient.somethingWentWrong) {
          setRxRequestStatus(Status.internetError);
          isLoadMoreRunning(false);
          refresh();
        } else {
          setRxRequestStatus(Status.error);
          isLoadMoreRunning(false);
          refresh();
        }
        ApiChecker.checkApi(response);
        isLoadMoreRunning(false);
        refresh();
      }
    }
  }

  Future<void> addScrollListener() async {
    callsScrollControloler.value.addListener(() {
      if (callsScrollControloler.value.position.atEdge) {
        if (callsScrollControloler.value.position.pixels != 0) {
          loadMoreDoctorCallHistory();
        }
      }
    });
  }

  @override
  void onInit() {
    callsScrollControloler.value.addListener(addScrollListener);
    getDoctorCallHistory();

    super.onInit();
  }

  deleteSingalCallHistory({required String id}) async {
    var response = await ApiClient.deleteData(ApiUrl.deleteCallHistory(id: id));

    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"], isError: false);
      debugPrint(
          "======================== Delelte History ==========================");
      getDoctorCallHistory();
    } else {
      ApiChecker.checkApi(response);
    }
  }
//============================================ Search Calls History ==============================

  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<DoctorCallHistoryModel> doctorSearchCallHistoryList =
      <DoctorCallHistoryModel>[].obs;

  searchCallsHistory() async {
    doctorCallHistoryList.value = [];

    var response = await ApiClient.getData(
        ApiUrl.searchHistoryDoctor(name: searchController.value.text));
    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      doctorSearchCallHistoryList.value = List<DoctorCallHistoryModel>.from(
          response.body["data"].map((x) => DoctorCallHistoryModel.fromJson(x)));

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



 
}
