import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class DoctorScheduleController extends GetxController {
  List<String> scheduleTabs = [
    AppStrings.upcoming,
    AppStrings.reschedule,
    AppStrings.past,
  ];

  RxInt tabCurrentIndex = RxInt(0);
//=========================== Get All Appoinment =========================//
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  RxList<AppointmentModel> appointMentAllList = <AppointmentModel>[].obs;

  getAllDoctorAppointment() async {
    var response = await ApiClient.getData(ApiUrl.doctorAppointment);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      appointMentAllList.value = List<AppointmentModel>.from(
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
  //==================================== Pending Appointment ===========================//     ?status=pending

  final String pendingAppointmentUrl =
      "${ApiUrl.doctorAppointment}?status=pending";

  RxList<AppointmentModel> pendingAppointmentList = <AppointmentModel>[].obs;

  getPendingDoctorAppointment() async {
    var response = await ApiClient.getData(pendingAppointmentUrl);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      pendingAppointmentList.value = List<AppointmentModel>.from(
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
  //============================== Past Appointment ===============================//

  final String pastAppointmentUrl = "${ApiUrl.doctorAppointment}?type=past";
  RxList<AppointmentModel> pastAppointment = <AppointmentModel>[].obs;

  Future<void> getPastDoctorAppointment() async {
    var response = await ApiClient.getData(pastAppointmentUrl);

    if (response.statusCode == 200) {
      pastAppointment.value = List<AppointmentModel>.from(
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

  @override
  void onInit() {
    getAllDoctorAppointment();
    getPendingDoctorAppointment();
    getPastDoctorAppointment();
    super.onInit();
  }
}
