import 'dart:io';

import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController {
  //=========================== Front and back image get ================================//
  Rx<File?> frontImageFile = File('').obs;
  Rx<File?> backImageFile = File('').obs;

  Future<void> getPaymentCard({required String imageType}) async {
    final pickImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 15);

    if (pickImage != null) {
      if (imageType == AppStrings.front) {
        frontImageFile.value = File(pickImage.path);
        refresh();
      } else {
        backImageFile.value = File(pickImage.path);
        refresh();
      }
    }
  }

  //======================= Get user date of birth ==============================

  Rx<TextEditingController> dateOfbirthController = TextEditingController().obs;

  Future<void> getDateOfBirth() async {
    final pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (pickDate != null) {
      dateOfbirthController.value.text =
          DateFormat('dd/MM/yyyy').format(pickDate);
    }
  }
  //================================ Field contropller =================================

  Rx<TextEditingController> addressCityController = TextEditingController().obs;
  Rx<TextEditingController> addressCountryController =
      TextEditingController().obs;
  Rx<TextEditingController> addressPostalCodeController =
      TextEditingController().obs;
  Rx<TextEditingController> lineOneController = TextEditingController().obs;
  Rx<TextEditingController> bankAccountNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> accountHolderTypeController =
      TextEditingController().obs;
  Rx<TextEditingController> bankInfoCountryController =
      TextEditingController().obs;
  Rx<TextEditingController> bankInfoCurrencyController =
      TextEditingController().obs;
  Rx<TextEditingController> bankInfoBusinessController =
      TextEditingController().obs;
  Rx<TextEditingController> bankInfoWebsiteController =
      TextEditingController().obs;
  Rx<TextEditingController> bankInfoProductDiscriptionController =
      TextEditingController().obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;

  Future<void> addNewCard() async {
    if (frontImageFile.value != null && backImageFile.value != null) {
      Map<String, String> body = {
        "business_profile[product_description]":
            bankInfoProductDiscriptionController.value.text,
        "business_profile[website]": bankInfoWebsiteController.value.text,
        "business_profile[business_name]":
            bankInfoBusinessController.value.text,
        "bank_info[currency]": bankInfoCurrencyController.value.text,
        "bank_info[country]": bankInfoCountryController.value.text,
        "bank_info[account_number]": bankAccountNumberController.value.text,
        "bank_info[account_holder_type]":
            accountHolderTypeController.value.text,
        "bank_info[account_holder_name]": nameController.value.text,
        "line1": lineOneController.value.text,
        "address[postal_code]": addressPostalCodeController.value.text,
        "address[country]": addressCountryController.value.text,
        "address[city]": addressCityController.value.text,
      };

      var response = await ApiClient.postMultipartData(
          ApiUrl.doctorCreatePaymentAccount, body,
          multipartBody: [
            MultipartBody(
              "kycFront",
              frontImageFile.value!,
            ),
            MultipartBody("kycBack", backImageFile.value!)
          ]);

      if (response.statusCode == 200) {}
    }
  }
}
