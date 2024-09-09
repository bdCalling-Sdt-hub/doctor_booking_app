import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/helper/time_converter/time_converter.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class DoctorAuthController extends GetxController {
  GeneralController generalController = Get.find<GeneralController>();

  var currentStep = 0.obs;

  void updateStep(int step) {
    currentStep.value = step;
  }

  ///=======================Remember me ========================
  RxBool isRemember = false.obs;

  toggleRemember() {
    isRemember.value = !isRemember.value;
    debugPrint("Remember me==============>>>>>>>>>$isRemember");
    refresh();
    SharePrefsHelper.setBool(AppConstants.isRememberMe, isRemember.value);
  }

  ///====================Document images============
  RxString documentImage = "".obs;
  Rx<File> imageFile = File("").obs;

  documentImages() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      documentImage.value = getImages.path;
    }
  }

  //===================== Doctor Personal info controller =======================
  Rx<TextEditingController> doctorNameController =
      TextEditingController(text: kDebugMode ? "Rafsan" : "").obs;

  Rx<TextEditingController> doctorDateOfBirthController =
      TextEditingController(text: kDebugMode ? "Augest 25, 2024" : "").obs;

  Rx<TextEditingController> doctorEmailController =
      TextEditingController(text: kDebugMode ? "nababej364@kwalah.com" : "")
          .obs;

  Rx<TextEditingController> doctorPhoneNumberController =
      TextEditingController(text: kDebugMode ? "123456789" : "").obs;

  Rx<TextEditingController> doctorLocationController =
      TextEditingController(text: kDebugMode ? "Badda, Dhaka" : "").obs;

  Rx<TextEditingController> doctorPasswordController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "").obs;

  Rx<TextEditingController> doctorConfirmPasswordController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "").obs;

  //================== Doctor Appointment Time controller ==========================//
  Rx<TextEditingController> sundayTypeController = TextEditingController().obs;
  Rx<TextEditingController> sundayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> sundayEndTimeController =
      TextEditingController().obs;

  Rx<TextEditingController> mondayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> mondayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> mondayTypeController = TextEditingController().obs;

  Rx<TextEditingController> tuesdayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> tuesdayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> tuesdayTypeController = TextEditingController().obs;

  Rx<TextEditingController> weddayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> weddayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> weddayTypeController = TextEditingController().obs;

  Rx<TextEditingController> thursdayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> thursdayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> thursdayTypeController =
      TextEditingController().obs;

  Rx<TextEditingController> fridayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> fridayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> fridayTypeController = TextEditingController().obs;

  Rx<TextEditingController> saturdayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> saturdayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> saturdayTypeController =
      TextEditingController().obs;

  ///============================== Professional Information ===============================
  Rx<TextEditingController> specialisController =
      TextEditingController(text: kDebugMode ? "Teeth" : "").obs;

  Rx<TextEditingController> appointmentFeeController =
      TextEditingController(text: kDebugMode ? "50" : "").obs;

  Rx<TextEditingController> experienceController =
      TextEditingController(text: kDebugMode ? "8" : "").obs;

  Rx<TextEditingController> educationController =
      TextEditingController(text: kDebugMode ? "CSE" : "").obs;

  Rx<TextEditingController> affiliationController =
      TextEditingController(text: kDebugMode ? "BdCalling" : "").obs;

  getTime({
    required int day,
    required int num,
  }) async {
    final picTime = await showTimePicker(
        context: Get.context!, initialTime: TimeOfDay.now());

    if (picTime != null) {
    

      String formatDateTime = DateConverter.formatTimeOfDay(picTime);
      //=================== Sun Day ================
      if (day == 1 && num == 1) {
        sundayStartTimeController.value.text = formatDateTime;
      } else if (day == 1 && num == 2) {
        sundayEndTimeController.value.text = formatDateTime;
        //=================== Mon Day ====================//
      } else if (day == 2 && num == 1) {
        mondayStartTimeController.value.text = formatDateTime;
      } else if (day == 2 && num == 2) {
        mondayEndTimeController.value.text = formatDateTime;

        //=================== TuesDay ===================//
      } else if (day == 3 && num == 1) {
        tuesdayStartTimeController.value.text = formatDateTime;
      } else if (day == 3 && num == 2) {
        tuesdayEndTimeController.value.text = formatDateTime;
        //======================== Wednesday ================//
      } else if (day == 4 && num == 1) {
        weddayStartTimeController.value.text = formatDateTime;
      } else if (day == 4 && num == 2) {
        weddayEndTimeController.value.text = formatDateTime;
        //======================= ThursDay==================//
      } else if (day == 5 && num == 1) {
        thursdayStartTimeController.value.text = formatDateTime;
      } else if (day == 5 && num == 2) {
        thursdayEndTimeController.value.text = formatDateTime;
        //======================== Fryday =====================//
      } else if (day == 6 && num == 1) {
        fridayStartTimeController.value.text = formatDateTime;
      } else if (day == 6 && num == 2) {
        fridayEndTimeController.value.text = formatDateTime;
        //========================= Saturday ===================//
      } else if (day == 7 && num == 1) {
        saturdayStartTimeController.value.text = formatDateTime;
      } else if (day == 7 && num == 2) {
        saturdayEndTimeController.value.text = formatDateTime;
      }
    }
  }

  ///========================= Doctor Sign Up ===========================
  RxBool signUpLoading = false.obs;
  doctorSignUp() async {
    signUpLoading.value = true;
    refresh();
    // Create a Map for the request body
    Map<String, String> body = {
      // Personal
      "name": doctorNameController.value.text,
      "email": doctorEmailController.value.text,
      "date_of_birth": doctorDateOfBirthController.value.text,
      "location": doctorLocationController.value.text,
      "phone": doctorPhoneNumberController.value.text,
      "password": doctorConfirmPasswordController.value.text,
      "role": "DOCTOR",

      // Appointment
      "available_for": jsonEncode({
        "monday": mondayTypeController.value.text,
        "tuesday": tuesdayTypeController.value.text,
        "wednesday": weddayTypeController.value.text,
        "thursday": thursdayTypeController.value.text,
        "friday": fridayTypeController.value.text,
        "saturday": saturdayTypeController.value.text,
        "sunday": sundayTypeController.value.text
      }),
      "available_days": jsonEncode({
        "monday": {
          "startTime": mondayStartTimeController.value.text,
          "endTime": mondayEndTimeController.value.text
        },
        "tuesday": {
          "startTime": tuesdayStartTimeController.value.text,
          "endTime": tuesdayEndTimeController.value.text
        },
        "wednesday": {
          "startTime": weddayStartTimeController.value.text,
          "endTime": weddayEndTimeController.value.text
        },
        "thursday": {
          "startTime": thursdayStartTimeController.value.text,
          "endTime": thursdayEndTimeController.value.text
        },
        "friday": {
          "startTime": fridayStartTimeController.value.text,
          "endTime": fridayEndTimeController.value.text
        },
        "saturday": {
          "startTime": saturdayStartTimeController.value.text,
          "endTime": saturdayEndTimeController.value.text
        },
        "sunday": {
          "startTime": sundayStartTimeController.value.text,
          "endTime": sundayEndTimeController.value.text
        }
      }),

      // Professional Info
      "specialization": specialisController.value.text,
      "experience": experienceController.value.text,
      "educational_background": educationController.value.text,
      "current_affiliation": affiliationController.value.text,
      "appointment_fee": appointmentFeeController.value.text,
    };

    // Create the multipart data for the license image
    var multipartBody = [MultipartBody("license", imageFile.value)];

    // Send the request
    var response = await ApiClient.postMultipartData(
      ApiUrl.doctorSignUp, body, // This should be Map<String, dynamic>
      multipartBody: multipartBody,
    );

    if (response.statusCode == 201) {
      signUpLoading.value = false;
      refresh();
      Get.offAllNamed(AppRoutes.doctorSignupOtpScreen,
          arguments: doctorEmailController.value.text);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        signUpLoading.value = false;
        refresh();
      } else {}
      ApiChecker.checkApi(response);
      signUpLoading.value = false;
      refresh();
    }
  }
  //================================ varifide code =================================

  Rx<TextEditingController> verifyCodeController = TextEditingController().obs;

  Future<void> varifyEmail() async {
    generalController.showPopUpLoader();
    var body = {
      "email": doctorEmailController.value.text,
      "code": verifyCodeController.value.text,
    };

    var response =
        await ApiClient.postData(ApiUrl.varifyCode, jsonEncode(body));
    if (response.statusCode == 200) {
      navigator?.pop();
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["token"]);
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      Get.offAllNamed(AppRoutes.doctorHomeScreen);
      debugPrint("============================= Sucsses=================");
    } else {
      navigator?.pop();
      toastMessage(message: response.body["message"]);
    }
  }
}
