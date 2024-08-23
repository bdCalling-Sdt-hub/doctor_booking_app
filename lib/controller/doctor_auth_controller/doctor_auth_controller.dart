import 'dart:io';

import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DoctorAuthController extends GetxController {
  ///======================Driver sign up ================

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
  Rx<TextEditingController> doctorNameController = TextEditingController().obs;
  Rx<TextEditingController> doctorDateOfBirthController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorEmailController = TextEditingController().obs;
  Rx<TextEditingController> doctorPhoneNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorLocationController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorConfirmPasswordController =
      TextEditingController().obs;

  //================== Doctor Appointment Time controller ==========================//

  Rx<TextEditingController> sundayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> sundayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> mondayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> mondayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> tuesdayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> tuesdayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> weddayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> weddayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> thursdayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> thursdayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> frydayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> frydayEndTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> satardayStartTimeController =
      TextEditingController().obs;
  Rx<TextEditingController> satardayEndTimeController =
      TextEditingController().obs;

  getTime({
    required int day,
    required int num,
  }) async {
    final picTime = await showTimePicker(
        context: Get.context!, initialTime: TimeOfDay.now());

    if (picTime != null) {
      DateTime dateTimeNow = DateTime.now();

      DateTime picDate = DateTime(
        dateTimeNow.year,
        dateTimeNow.month,
        dateTimeNow.day,
        picTime.hour,
        picTime.minute,
      );

      String formatDateTime = DateFormat.jm().format(picDate);
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
        frydayStartTimeController.value.text = formatDateTime;
      } else if (day == 6 && num == 2) {
        frydayEndTimeController.value.text = formatDateTime;
        //========================= Saturday ===================//
      } else if (day == 7 && num == 1) {
        satardayStartTimeController.value.text = formatDateTime;
      } else if (day == 7 && num == 2) {
        satardayEndTimeController.value.text = formatDateTime;
      }
    }
  }
}
