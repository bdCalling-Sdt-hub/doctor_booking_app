import 'dart:convert';

import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/api_keys.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

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

  //======================== Get permission from user device ======================

  void determinePosition() async {
    if (!await Permission.location.isGranted) {
      PermissionStatus status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        return toastMessage(message: 'Location permissions are denied');
      }
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return toastMessage(message: 'Turn on Location');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // ignore: unnecessary_null_comparison
    if (position.latitude != null && position.longitude != null) {
      // Get.toNamed(AppRoutes.hospitalScreen,
      //     arguments: [value.latitude, value.longitude]);

      fetchNearbyHospitals(
          position.latitude, position.longitude, GOOGLE_MAP_KEY);

      //fetchNearbyHospitals(24.098379, 90.328712, GOOGLE_MAP_KEY);
    }
  }

  RxList<HospitalModel> hospitalList = <HospitalModel>[].obs;

  void fetchNearbyHospitals(
      double latitude, double longitude, String apiKey) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=2000&type=hospital&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      hospitalList.value = List<HospitalModel>.from(
          data["results"].map((x) => HospitalModel.fromJson(x)));

      debugPrint("Hospital List=======>>>>>>>>>${hospitalList.length}");

      Get.toNamed(
        AppRoutes.hospitalScreen,
      );
    } else {
      toastMessage(message: "Failed to load hospitals");
    }
  }
}
