import 'dart:async';
import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PatientAuthController extends GetxController {
  GeneralController generalController = Get.find<GeneralController>();
// ============================ Sign in text Editing controller ======================

  final TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "powirrrde4919@daypey.com" : "");
  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "1234567" : "");

  ///=================== Update Interest ===================
  RxList<String> interestList = [
    "Cardiologists",
    "Endocrinologists",
    "Nephrologists",
    "Dermatologist",
    "Gynecologists",
    "Hematologists",
    "Neurologist",
  ].obs;

  RxList<bool> isSelectedList = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  RxList<String> selectedInterested = <String>[].obs;
  updateInterest({required int index}) async {
    isSelectedList[index] = !isSelectedList[index];
    isSelectedList.refresh();

    String selectedItem = interestList[index]; // Safely retrieve the item

    if (selectedInterested.contains(selectedItem)) {
      selectedInterested.remove(selectedItem);
    } else {
      selectedInterested.add(selectedItem);
    }
    selectedInterested.refresh();
    interestList.refresh();
  }

  ///======================== sign in method =====================///

  bool signinLoading = false;
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
      if (response.body['data']['role'] == 'DOCTOR') {
        saveInfo(response: response);
        Get.offAllNamed(AppRoutes.doctorHomeScreen);
      } else {
        saveInfo(response: response);
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading.value = false;
    refresh();
  }

  ///============================= Sign Up ===========================

  signUpUser() async {
    generalController.showPopUpLoader();

    var body = {
      "name": patientNameController.value.text,
      "email": patientEmailController.value.text,
      "date_of_birth": patientDateOfBirthController.value.text,
      "location": patientLoactionController.value.text,
      "phone": patientPhoneNumberController.value.text,
      "confirm_password": patientConfirmPasswordController.value.text,
      "password": patientPasswordController.value.text,
      //"role": "USER"
    };

    var response = await ApiClient.postData(
      ApiUrl.paitentSignUp,
      jsonEncode(body),
    );

    if (response.statusCode == 200) {
      navigator?.pop();
      Get.toNamed(AppRoutes.signUpOtpScreen);
    } else {
      ApiChecker.checkApi(response);
      navigator?.pop();
    }
  }

  ///======================== Verify OTP Paitent ====================
  ///=============================== Verify OTP Sign Up =============================
  RxInt secondsRemaining = 3.obs;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        secondsRemaining.refresh();
      } else {
        timer.cancel();
      }
    });
  }

  RxString otp = "".obs;
  Future<void> verifyOTPSignUp() async {
    generalController.showPopUpLoader();
    var body = {
      "email": patientEmailController.value.text,
      "code": otp.value,
    };
    var response =
        await ApiClient.postData(ApiUrl.varifyCode, body, isContentType: false);

    if (response.statusCode == 200) {
      navigator?.pop();
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["accessToken"]);
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      navigator?.pop();
      toastMessage(message: response.body["message"]);
    }
  }

//====================== Get Patient Date of birth Method ===================

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

  //=============================== Patient Sing up Controller =========================//

  TextEditingController patientNameController =
      TextEditingController(text: kDebugMode ? "Rafsan" : "");

  Rx<TextEditingController> patientDateOfBirthController =
      TextEditingController(text: kDebugMode ? "August 10, 2024" : "").obs;

  Rx<TextEditingController> patientEmailController =
      TextEditingController(text: kDebugMode ? "nababej364@kwalah.com" : "")
          .obs;

  Rx<TextEditingController> patientPhoneNumberController =
      TextEditingController(text: kDebugMode ? "1234567" : "").obs;

  Rx<TextEditingController> patientLoactionController =
      TextEditingController(text: kDebugMode ? "Badda, Dhaka" : "").obs;

  Rx<TextEditingController> patientPasswordController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "").obs;

  Rx<TextEditingController> patientConfirmPasswordController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "").obs;

  ////=========================== Save Info =============================
  saveInfo({required Response<dynamic> response}) {
    SharePrefsHelper.setString(
        AppConstants.bearerToken, response.body["token"]);

    SharePrefsHelper.setString(
        AppConstants.userName, response.body["data"]["name"]);
    SharePrefsHelper.setString(AppConstants.id, response.body["data"]["_id"]);

    SharePrefsHelper.setString(
        AppConstants.userLocation, response.body["data"]["location"]);

    SharePrefsHelper.setString(
        AppConstants.userImage, response.body["data"]["image"] ?? "");

    generalController.getSavedInfo();
  }
}
