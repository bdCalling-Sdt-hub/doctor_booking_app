import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/patient_screen/call_history_screen/model/call_history_model.dart';
import 'package:get/get.dart';

class CallHistoryController extends GetxController {
  final loading = Status.loading.obs;
  void loadingMethod(Status value) => loading.value = value;
  final GeneralController generalController = Get.find<GeneralController>();

  ///======================= Get Call List =========================

  RxList<CallHistoryDatum> callHistoryList = <CallHistoryDatum>[].obs;

  getCallList() async {
    loadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.getCallHistory);

    if (response.statusCode == 200) {
      callHistoryList.value = List<CallHistoryDatum>.from(
          response.body["data"].map((x) => CallHistoryDatum.fromJson(x)));

      loadingMethod(Status.completed);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        loadingMethod(Status.internetError);
      } else {
        loadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  removeCallHistory({required String callID, required int index}) async {
    generalController.showPopUpLoader();
    //TODO============= Change URL
    var response = await ApiClient.deleteData(
      ApiUrl.deleteCallHistoryPaitent(id: callID),
    );
    if (response.statusCode == 200) {
      callHistoryList.removeAt(index);
      navigator?.pop();
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getCallList();
    super.onInit();
  }
}
