import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

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
    };

    loading.value = true;

    var resposns =
        await ApiClient.patchData(ApiUrl.changePassword, jsonEncode(body));
    if (resposns.statusCode == 200) {
      Get.back();
      print('sussces');
    }
  }
}
