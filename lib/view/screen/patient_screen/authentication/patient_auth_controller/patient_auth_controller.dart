import 'dart:async';
import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/service/socket_service.dart';
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
      TextEditingController(text: kDebugMode ? "mdh95831@gmail.com" : "");
  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "");

  ///=================== Update Interest ===================

  updateInterest() async {
    generalController.showPopUpLoader();
    Map<String, String> body = {
      // ignore: invalid_use_of_protected_member
      "category": jsonEncode(generalController.selectedInterest.value),
    };

    var response = await ApiClient.patchMultipartData(
        ApiUrl.updateProfile, body,
        haveImage: false);

    if (response.statusCode == 200) {
      navigator?.pop();
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
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
      // SocketApi.socket.dispose();
      // SocketApi.socket.disconnect().;

      signInLoading.value = false;
      refresh();
      if (response.body['data']['role'] == 'DOCTOR') {
        saveInfo(response: response);
        SocketApi.init();
        Get.offAllNamed(AppRoutes.doctorHomeScreen);
      } else {
        saveInfo(response: response);
        SocketApi.init();
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    } else {
      ApiChecker.checkApi(response);
      signInLoading.value = false;
      refresh();
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
      "role": "USER"
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
  RxInt secondsRemaining = 30.obs;
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
    var response = await ApiClient.postData(ApiUrl.varifyCode, jsonEncode(body),
        isContentType: false,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $bearerToken'
        });

    if (response.statusCode == 200) {
      navigator?.pop();
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["token"]);

      Get.offAllNamed(AppRoutes.selectInterest, arguments: false);
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

  TextEditingController patientNameController = TextEditingController();

  Rx<TextEditingController> patientDateOfBirthController =
      TextEditingController().obs;

  Rx<TextEditingController> patientEmailController =
      TextEditingController().obs;

  Rx<TextEditingController> patientPhoneNumberController =
      TextEditingController().obs;

  Rx<TextEditingController> patientLoactionController =
      TextEditingController().obs;

  Rx<TextEditingController> patientPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> patientConfirmPasswordController =
      TextEditingController().obs;

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
        AppConstants.userImage, response.body["data"]["img"] ?? "");

    SharePrefsHelper.setString(
        AppConstants.email, response.body["data"]["email"] ?? "");

    generalController.getSavedInfo();
  }

  ///=================== Resend OTP ====================
  resendOtp() async {
    generalController.showPopUpLoader();
    Map<String, String> body = {
      "email": patientEmailController.value.text,
    };

    var response = await ApiClient.postData(
      ApiUrl.resendCode,
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      secondsRemaining.value = 30;
      secondsRemaining.refresh();
      startTimer();
      navigator?.pop();
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  //================================== Forgot Password =============================

  Rx<TextEditingController> forgotPasswordEmailController =
      TextEditingController().obs;

  RxBool forgotLoading = false.obs;

  Future<void> forgotPassword() async {
    forgotLoading.value = true;
    refresh();
    Map<String, String> body = {
      "email": forgotPasswordEmailController.value.text,
    };

    var response = await ApiClient.postData(
      ApiUrl.forgotPassword,
      jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.forgotOtpScreen);
      forgotLoading.value = false;
      refresh();
    } else {
      ApiChecker.checkApi(response);
      forgotLoading.value = false;
      refresh();
    }
  }

  ///============================== Verify Forgot Password OTP =============================

  RxString? acccesToken;

  Rx<TextEditingController> otpController = TextEditingController().obs;

  Future<void> verifyOTPForgotPassword() async {
    generalController.showPopUpLoader();
    var body = {
      "email": forgotPasswordEmailController.value.text,
      "code": otpController.value.text,
    };
    var response = await ApiClient.postData(ApiUrl.varifyCode, jsonEncode(body),
        isContentType: false,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $bearerToken'
        });

    if (response.statusCode == 200) {
      acccesToken?.value = response.body["accessToken"];

      // SharePrefsHelper.setString(
      //     AppConstants.accesToken, response.body["accessToken"]);

      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["accessToken"]);
      refresh();
      Get.offAllNamed(AppRoutes.resetPasswordScreen);
    } else {
      toastMessage(message: response.body["message"]);
    }
  }

  resendForgotOtp() async {
    generalController.showPopUpLoader();
    Map<String, String> body = {
      "email": forgotPasswordEmailController.value.text,
    };

    var response = await ApiClient.postData(
      ApiUrl.resendCode,
      jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      secondsRemaining.value = 30;
      secondsRemaining.refresh();
      startTimer();
      navigator?.pop();
    } else {
      navigator?.pop();
      ApiChecker.checkApi(response);
    }
  }

  //======================== Reset Password ====================

  Rx<TextEditingController> resetPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> resetConfirmPasswordController =
      TextEditingController().obs;

  RxBool resetPasswordLoading = false.obs;

  Future<void> resetPassword() async {
    final token = await SharePrefsHelper.getString(AppConstants.accesToken);

    debugPrint("============================ token=================$token");

    resetPasswordLoading.value = true;
    refresh();
    Map<String, String> body = {
      "password": resetPasswordController.value.text,
      "confirm_password": resetConfirmPasswordController.value.text,
    };

    var response = await ApiClient.postData(
      ApiUrl.resetPassword,
      jsonEncode(body),
      // headers: {'Content-Type': 'application/json', 'Authorization': token},
    );
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"], colors: Colors.green);
      Get.offAllNamed(AppRoutes.signInScreen);
      resetPasswordLoading.value = false;
      refresh();
    } else {
      ApiChecker.checkApi(response);
      resetPasswordLoading.value = false;
      refresh();
    }
  }

  ///==================== Change Password =======================
}
