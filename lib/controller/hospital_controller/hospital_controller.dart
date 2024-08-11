import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:get/get.dart';

class HospitalController extends GetxController {
  final List<Map<String, String>> hospitals = [
    {"image": AppConstants.hospitalOne, "name": "Hospital 1"},
    {"image": AppConstants.hospitalOTwo, "name": "Hospital 2"},
    {"image": AppConstants.hospitalOThree, "name": "Hospital 3"},
    {"image": AppConstants.hospitalOne, "name": "Hospital 4"},
    {"image": AppConstants.hospitalOTwo, "name": "Hospital 4"},
    {"image": AppConstants.hospitalOTwo, "name": "Hospital 4"},
    {"image": AppConstants.hospitalOTwo, "name": "Hospital 4"},
    // Add more hospitals here
  ];
}
