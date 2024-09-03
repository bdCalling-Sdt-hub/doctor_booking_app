import 'dart:convert';
import 'dart:io';

import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/model/doctor_profile_model/doctor_profile_model.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/widgets/custom_image_picker_popup/custom_image_picker_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DoctorProfileController extends GetxController {
  final DoctorHomeController doctorHomeController =
      Get.find<DoctorHomeController>();
  Rx<TextEditingController> doctorNameController = TextEditingController().obs;
  Rx<TextEditingController> doctorDateOfBirthController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorEmailController = TextEditingController().obs;
  Rx<TextEditingController> doctorPhoneController = TextEditingController().obs;
  Rx<TextEditingController> doctorLoactionController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorSpecializationController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorYearOfExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorEducationalBackgroundController =
      TextEditingController().obs;
  Rx<TextEditingController> doctorCurrentAlliliationController =
      TextEditingController().obs;

  textControllerValueAdd(ProfileModel model) {
    doctorNameController.value.text = model.name ?? '';
    doctorDateOfBirthController.value.text = model.dateOfBirth ?? '';

    doctorEmailController.value.text = model.email ?? '';
    doctorPhoneController.value.text = model.phone ?? '';
    doctorLoactionController.value.text = model.location ?? '';

    doctorSpecializationController.value.text = model.specialization ?? '';
    doctorYearOfExperienceController.value.text = model.experience ?? '';
    doctorEducationalBackgroundController.value.text =
        model.educationalBackground ?? '';
    doctorCurrentAlliliationController.value.text =
        model.currentAffiliation ?? '';
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///================================ Get doctor profile =========================//

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  getDoctorProfile() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.profile);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);
      profileModel.value = ProfileModel.fromJson(response.body['data']);
      textControllerValueAdd(profileModel.value);
      initAvalibleDayList(profileModel.value);
      debugPrint(profileModel.value.name);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
  //====================================================== update doctor profile =========================================//

  getDoctorProfileImage() {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return SizedBox(
            height: 70,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomImagePickerPopup(
                galleryButton: () {
                  Navigator.pop(Get.context!);
                  openGallery(source: ImageSource.gallery);
                },
                cammeraButton: () {
                  Navigator.pop(Get.context!);
                  openGallery(source: ImageSource.camera);
                },
              ),
            ),
          );
        });
  }

  Rx<File?> proImage = Rx<File?>(null);

  Future<void> openGallery({required ImageSource source}) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 10);
    if (pickedFile != null) {
      proImage.value = File(pickedFile.path);
    }
  }

  ////==================================== Updated Doctor personal profile =================//
  RxBool updatePersonalLoading = false.obs;
  Future<void> updateDoctorPersonalProfile() async {
    String id = await SharePrefsHelper.getString(AppConstants.id);
    updatePersonalLoading.value = true;
    refresh();
    Map<String, String> body = {
      'name': doctorNameController.value.text,
      'email': doctorEmailController.value.text,
      'date_of_birth': doctorDateOfBirthController.value.text,
      'location': doctorLoactionController.value.text,
      'phone': doctorPhoneController.value.text,
    };

    var response = proImage.value != null
        ? await ApiClient.patchMultipartData(
            "${ApiUrl.updateDoctorProfile}$id", body,
            multipartBody: [MultipartBody("img", proImage.value!)])
        : await ApiClient.patchData(
            "${ApiUrl.updateDoctorProfile}$id", jsonEncode(body));

    if (response.statusCode == 200) {
      getDoctorProfile();
      updatePersonalLoading.value = false;
      Get.back();
      proImage.value = null;

      refresh();
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      Get.back();
    } else {
      updatePersonalLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.noInternetMessage) {
      } else {}
      updatePersonalLoading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }
//================================== Update doctor professional profile ===============================//

  getDoctorLicenseImage() {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return SizedBox(
            height: 70,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomImagePickerPopup(
                galleryButton: () {
                  Navigator.pop(Get.context!);
                  getLicenseImage(source: ImageSource.gallery);
                },
                cammeraButton: () {
                  Navigator.pop(Get.context!);
                  getLicenseImage(source: ImageSource.camera);
                },
              ),
            ),
          );
        });
  }

  Rx<File?> licenseImage = Rx<File?>(null);

  Future<void> getLicenseImage({required ImageSource source}) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 10);
    if (pickedFile != null) {
      licenseImage.value = File(pickedFile.path);
    }
  }

  //======================== update Professional profile ================//
  RxBool updateProfessionalLoading = false.obs;
  Future<void> updateDoctorProfessionalProfile() async {
    String id = await SharePrefsHelper.getString(AppConstants.id);
    updateProfessionalLoading.value = true;
    refresh();
    Map<String, String> body = {
      'specialization': doctorSpecializationController.value.text,
      'experience': doctorYearOfExperienceController.value.text,
      'educational_background':
          doctorEducationalBackgroundController.value.text,
      'current_affiliation': doctorCurrentAlliliationController.value.text,
    };

    var response = licenseImage.value != null
        ? await ApiClient.patchMultipartData(
            "${ApiUrl.updateDoctorProfile}$id", body,
            multipartBody: [MultipartBody("img", licenseImage.value!)])
        : await ApiClient.patchData(
            "${ApiUrl.updateDoctorProfile}$id", jsonEncode(body));

    if (response.statusCode == 200) {
      getDoctorProfile();
      updateProfessionalLoading.value = false;
      licenseImage.value = null;

      refresh();
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      Get.back();
    } else {
      updateProfessionalLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.noInternetMessage) {
      } else {}
      updateProfessionalLoading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }

  ///=============================== Doctor Avalible day list init ===================================///

  RxList<String> sundayAvailableList = <String>[].obs;
  RxList<String> mondayAvailableList = <String>[].obs;
  RxList<String> tuedayAvailableList = <String>[].obs;
  RxList<String> weddayAvailableList = <String>[].obs;
  RxList<String> thudayAvailableList = <String>[].obs;
  RxList<String> fridayAvailableList = <String>[].obs;
  RxList<String> satdayAvailableList = <String>[].obs;
  initAvalibleDayList(ProfileModel model) {
    sundayAvailableList.value = model.availableDays?.sunday ?? [];
    mondayAvailableList.value = model.availableDays?.monday ?? [];
    tuedayAvailableList.value = model.availableDays?.tuesday ?? [];
    if (model.availableDays?.wednesday != null) {
      weddayAvailableList.value = model.availableDays?.wednesday ?? [];
    }

    thudayAvailableList.value = model.availableDays?.thursday ?? [];
    fridayAvailableList.value = model.availableDays?.friday ?? [];
    satdayAvailableList.value = model.availableDays?.saturday ?? [];
    //========================= Sun day start time and end time init =====================
    if (sundayAvailableList.isNotEmpty) {
      sundayStartTimeController.value.text = sundayAvailableList[0];
      sundayEndTimeController.value.text =
          sundayAvailableList[sundayAvailableList.length - 1];
    }
    //========================= Mon day start time and end time init =====================
    if (mondayAvailableList.isNotEmpty) {
      mondayStartTimeController.value.text = mondayAvailableList[0];
      mondayEndTimeController.value.text =
          mondayAvailableList[mondayAvailableList.length - 1];
    }
    //========================= tue day start time and end time init =====================
    if (tuedayAvailableList.isNotEmpty) {
      tuesdayStartTimeController.value.text = tuedayAvailableList[0];
      tuesdayEndTimeController.value.text =
          tuedayAvailableList[tuedayAvailableList.length - 1];
    }
    //========================= Wed day start time and end time init =====================
    if (weddayAvailableList.isNotEmpty) {
      weddayStartTimeController.value.text = weddayAvailableList[0];
      weddayEndTimeController.value.text =
          weddayAvailableList[weddayAvailableList.length - 1];
    }
    //========================= Thurs day start time and end time init =====================
    if (thudayAvailableList.isNotEmpty) {
      thursdayStartTimeController.value.text = thudayAvailableList[0];
      thursdayEndTimeController.value.text =
          thudayAvailableList[thudayAvailableList.length - 1];
    }
    //========================= Fri day start time and end time init =====================
    if (fridayAvailableList.isNotEmpty) {
      fridayStartTimeController.value.text = fridayAvailableList[0];
      fridayEndTimeController.value.text =
          fridayAvailableList[fridayAvailableList.length - 1];
    }
    //========================= Satar day start time and end time init =====================
    if (satdayAvailableList.isNotEmpty) {
      saturdayStartTimeController.value.text = satdayAvailableList[0];
      saturdayEndTimeController.value.text =
          satdayAvailableList[satdayAvailableList.length - 1];
    }

    sundayTypeController.value.text = model.availableFor?.sunday ?? '';
    mondayTypeController.value.text = model.availableFor?.monday ?? '';
    tuesdayTypeController.value.text = model.availableFor?.tuesday ?? '';
    weddayTypeController.value.text = model.availableFor?.wednesday ?? '';
    thursdayTypeController.value.text = model.availableFor?.thursday ?? '';
    fridayTypeController.value.text = model.availableFor?.friday ?? '';
    saturdayTypeController.value.text = model.availableFor?.saturday ?? '';
  }

  ///=============================================== Doctor appointment edit ==================================//

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
//============================ Appoint get start time and end time get =====================//
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

  //====================================== Updater Doctor Appointment ==================================//
  RxBool updateAppointmentLoading = false.obs;
  Future<void> updateDoctorAppointment() async {
    String id = await SharePrefsHelper.getString(AppConstants.id);
    updateAppointmentLoading.value = true;
    refresh();
    Map<String, String> body = {
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
      "available_for": jsonEncode({
        "monday": mondayTypeController.value.text,
        "tuesday": tuesdayTypeController.value.text,
        "wednesday": weddayTypeController.value.text,
        "thursday": thursdayTypeController.value.text,
        "friday": fridayTypeController.value.text,
        "saturday": saturdayTypeController.value.text,
        "sunday": saturdayTypeController.value.text,
      })
    };

    var response = await ApiClient.patchData(
        "${ApiUrl.updateDoctorProfile}$id", jsonEncode(body));

    if (response.statusCode == 200) {
      getDoctorProfile();
      updateAppointmentLoading.value = false;

      refresh();
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );

      Get.back();
    } else {
      updateAppointmentLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.noInternetMessage) {
      } else {}
      updateAppointmentLoading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getDoctorProfile();
    super.onInit();
  }
}
