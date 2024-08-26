import 'dart:convert';

import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PatientAuthController extends GetxController {
// ============================ Sign in text Editing controller ======================

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///============================================= sign in method =====================///

  bool signinLoading = false;

  // Future<void> userSignin() async {
  //   signinLoading = true;
  //   update();

  //   Map<String, String> body = {
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   };

  //   var response = await ApiClient.postData(ApiConstant.login, body);

  //   if (response.statusCode == 200) {
  //     Get.to(AppRoutes.homeScreen);
  //   }

  // }
  bool get isLoding => signinLoading;

  RxBool signInLoading = false.obs;
  signInUser() async {
    signInLoading.value = true;
    refresh();
    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    var response = await ApiClient.postData(
      ApiUrl.login,
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["token"]);

      if (response.body['data']['role'] == 'DOCTOR') {
        Get.offAllNamed(AppRoutes.doctorHomeScreen);
      } else {
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading.value = false;
    refresh();
  }

  saveInformationInit({required Response<dynamic> response}) async {
    SharePrefsHelper.setString(
        AppConstants.bearerToken, response.body["token"]);
    //PrefsHelper.setBool(AppConstants.isSocialLogIn, false);
    SharePrefsHelper.setString(
      AppConstants.profileID,
      response.body["user"]["id"].toString(),
    );
    SharePrefsHelper.setString(
      AppConstants.role,
      response.body["user"]["role"].toString(),
    );

    debugPrint(
        'Role ==========================>>>>>>${response.body["user"]["role"]}');

    emailController.clear();
    passwordController.clear();

    // GeneralController generalController = Get.find<GeneralController>();

    // generalController.getAllInfo();
  }

//====================== Get Patient Date of birth Method =================

  getPatientDateOfBirth() async {
    final DateTime? pickDate = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(1970),
        lastDate: DateTime.now());
    if (pickDate != null) {
      final formatDate = DateFormat.yMMMMd().format(pickDate);

      patientDateOfBirthController.value.text = formatDate;
    }
  }

  //=============================== Patient Sing up Controller ======================//
  TextEditingController patientNameController = TextEditingController();
  Rx<TextEditingController> patientDateOfBirthController =
      TextEditingController().obs;
  TextEditingController patientEmailController = TextEditingController();
  TextEditingController patientPhoneNumberController = TextEditingController();
  TextEditingController patientLoactionController = TextEditingController();
  TextEditingController patientPasswordController = TextEditingController();
  TextEditingController patientConfirmPasswordController =
      TextEditingController();
}
