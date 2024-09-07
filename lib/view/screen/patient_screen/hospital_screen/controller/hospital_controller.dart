import 'dart:convert';

import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
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
    print("object");
    if (!await Permission.location.isGranted) {
      PermissionStatus status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        return Future.error('Location permissions are denied');
      }
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    await Geolocator.getCurrentPosition().then((value) {
      if (value.latitude != null && value.longitude != null) {
        // Get.toNamed(AppRoutes.hospitalScreen,
        //     arguments: [value.latitude, value.longitude]);

        fetchNearbyHospitals(value.latitude, value.longitude, "");
      }
    });
  }

  Future<List> fetchNearbyHospitals(
      double latitude, double longitude, String apiKey) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&type=hospital&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      List hospitals = data['results'];

      print("Hospital List=======>>>>>>>>>$hospitals");
      return hospitals;
    } else {
      throw Exception('Failed to load hospitals');
    }
  }
}
