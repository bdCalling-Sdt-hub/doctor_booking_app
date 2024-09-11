import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class PaitentProfileController extends GetxController {
  final profileLoading = Status.loading.obs;
  void profileLoadingMethod(Status value) => profileLoading.value = value;
  GeneralController generalController = Get.find<GeneralController>();

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  Rx<TextEditingController> ganderController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;

  Rx<TextEditingController> currentPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  Rx<TextEditingController> retypePasswordController =
      TextEditingController().obs;

  ///============================Image picker method================
  RxString image = "".obs;

  Rx<File> imageFile = File("").obs;
  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      image.value = getImages.path;
    }
  }

  final List<Map<String, String>> faqList = [
    {
      "que": "How do I book an appointment?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "Can I cancel or reschedule my appointment?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "What types of doctors can I book through the app?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How do I check in for my appointment?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How can I canceled an appointment? ",
      "ans": "This is an dummy answer, To show in UI"
    },
  ];

  ///===================Customer care method ==========
  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // =========================== Change Password ======================//

  Rx<TextEditingController> currentPassController = TextEditingController().obs;
  Rx<TextEditingController> newPassController = TextEditingController().obs;
  Rx<TextEditingController> reTypeNewPassController =
      TextEditingController().obs;

  RxBool loading = false.obs;

  changePassword() async {
    Map<String, dynamic> body = {
      "old_Password": currentPassController.value.text,
      "password": newPassController.value.text,
      "confirm_password": reTypeNewPassController.value.text,
    };

    loading.value = true;
    refresh();

    var response =
        await ApiClient.patchData(ApiUrl.changePassword, jsonEncode(body));
    if (response.statusCode == 200) {
      loading.value = false;
      refresh();
      showCustomSnackBar(
        response.body['message'],
        getXSnackBar: false,
        isError: false,
      );
      removeDataFormField();

      Get.back();
    } else {
      loading.value = false;
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
      } else {}
      loading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }

  removeDataFormField() {
    currentPassController.value.clear();
    newPassController.value.clear();
    reTypeNewPassController.value.clear();
  }

  ///=========================== Get Profile ==========================

  Rx<PaitentProfileModel> profileData = PaitentProfileModel().obs;
  getProfile() async {
    profileLoadingMethod(Status.loading);

    var response = await ApiClient.getData(ApiUrl.getProfile);

    if (response.statusCode == 200) {
      profileData.value = PaitentProfileModel.fromJson(response.body["data"]);
      saveInfo(profileData.value);
      profileLoadingMethod(Status.completed);
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        profileLoadingMethod(Status.internetError);
      } else {
        profileLoadingMethod(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///======================== Edit Profile =====================

  saveInfo(PaitentProfileModel profileData) async {
    image.value = "${ApiUrl.baseUrl}/${profileData.img ?? ""}";
    fullNameController.value =
        TextEditingController(text: profileData.name ?? "");

    emailController.value =
        TextEditingController(text: profileData.email ?? "");

    phoneNumberController.value =
        TextEditingController(text: profileData.phone ?? "");

    dateOfBirthController.value =
        TextEditingController(text: profileData.dateOfBirth ?? "");

    ganderController.value =
        TextEditingController(text: profileData.gender ?? "");

    locationController.value =
        TextEditingController(text: profileData.location ?? "");

    SharePrefsHelper.setString(AppConstants.userImage, profileData.img ?? "");
    SharePrefsHelper.setString(AppConstants.userName, profileData.name ?? "");
    SharePrefsHelper.setString(
        AppConstants.userLocation, profileData.location ?? "");

    generalController.getSavedInfo();
  }

  editProfile() async {
    generalController.showPopUpLoader();

    var body = {
      "name": fullNameController.value.text,
      "date_of_birth": dateOfBirthController.value.text,
      "location": locationController.value.text,
      "phone": phoneNumberController.value.text,
      //"age": "",
      //"category": ""
      "gender": ganderController.value.text
    };

    var response = imageFile.value.path.isNotEmpty
        ? await ApiClient.patchMultipartData(ApiUrl.updateProfile, body,
            multipartBody: [MultipartBody("img", imageFile.value)])
        : await ApiClient.patchData(ApiUrl.updateProfile, body,
            isContentType: false);

    if (response.statusCode == 200) {
      getProfile();
      navigator?.pop();
      navigator?.pop();
      toastMessage(message: response.body["message"], colors: Colors.green);
    } else {
      ApiChecker.checkApi(response);
      navigator?.pop();
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
