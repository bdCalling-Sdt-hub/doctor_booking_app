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

  @override
  void onInit() {
    getDoctorProfile();
    super.onInit();
  }
}
