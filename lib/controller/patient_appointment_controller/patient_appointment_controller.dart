import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class PatientAppointmentController extends GetxController{
  ///=======================List============
  final List<String> userList = [
    AppStrings.upcoming,
    AppStrings.past,
    AppStrings.canceled,
  ];
  RxInt selectedIndex=0.obs;

}