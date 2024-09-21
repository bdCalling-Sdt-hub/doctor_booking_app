import 'dart:convert';
import 'dart:io';

import 'package:doctor_booking/model/stripe_account_model/stripe_account_model.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../model/appointment_history_model/appointment_history_model.dart';
import '../../../../../service/api_check.dart';

class DoctorPaymentController extends GetxController {
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

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
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
      dateOfbirthController.value.text = formatDate(pickDate);
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

  RxBool addCardLoading = false.obs;

  Future<void> addNewCard() async {
    if (frontImageFile.value != null && backImageFile.value != null) {
      addCardLoading(true);
      refresh();

      // Construct the body
      Map<String, String> body = {
        "dateOfBirth": dateOfbirthController.value.text,
        "data": jsonEncode({
          "address": {
            "city": addressCityController.value.text,
            "country": addressCountryController.value.text,
            "postal_code": addressPostalCodeController.value.text,
            "line1": lineOneController.value.text,
          },
          "bank_info": {
            "account_holder_name": nameController.value.text,
            "account_holder_type": accountHolderTypeController.value.text,
            "account_number": bankAccountNumberController.value.text,
            "country": bankInfoCountryController.value.text,
            "currency": bankInfoCurrencyController.value.text,
          },
          "business_profile": {
            "business_name": bankInfoBusinessController.value.text,
            "website": bankInfoWebsiteController.value.text,
            "product_description":
                bankInfoProductDiscriptionController.value.text,
          },
        })
      };

      // Sending the request
      var response = await ApiClient.postMultipartData(
          ApiUrl.doctorCreatePaymentAccount, body,
          multipartBody: [
            MultipartBody("kycFront", frontImageFile.value!),
            MultipartBody("kycBack", backImageFile.value!)
          ]);

      // Check response status
      if (response.statusCode == 200) {
        try {
          // Ensure the response body is properly decoded
          var responseBody = jsonDecode(response.body);
          if (responseBody is Map && responseBody.containsKey('message')) {
            showCustomSnackBar(responseBody['message'], isError: false);
          }
        } catch (e) {
          showCustomSnackBar('Error parsing response', isError: true);
        }
      } else {
        showCustomSnackBar('Something went wrong', isError: true);
      }

      addCardLoading(false);
      refresh();
    }
  }

//====================================== Doctor Payment History ================================//
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  RxList<AppointmentHistoryModel> paymentHistoryList =
      <AppointmentHistoryModel>[].obs;
  Future<void> getMyAppoinmentHistory() async {
    var response = await ApiClient.getData(ApiUrl.doctorPaymentHistory);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

      paymentHistoryList.value = List<AppointmentHistoryModel>.from(
          response.body['data'].map((x) =>
              AppointmentHistoryModel.fromJson(x as Map<String, dynamic>)));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  } 


  RxList<StripeAccountModel> stripeAccountList =
      <StripeAccountModel>[].obs;
  Future<void> getStripeAccount() async {
    var response = await ApiClient.getData(ApiUrl.getStripeAccount);

    if (response.statusCode == 200) {
      setRxRequestStatus(Status.completed);

       if (response.body['data'] is List) {
      // Handle list of StripeAccountModel
      stripeAccountList.value = List<StripeAccountModel>.from(
        (response.body['data'] as List).map((x) => StripeAccountModel.fromJson(x))
      );
    } else if (response.body['data'] is Map) {
      // Handle the map case if needed
      var dataMap = response.body['data'] as Map<String, dynamic>;
      stripeAccountList.value = [
        StripeAccountModel.fromJson(dataMap)
      ];
    }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getMyAppoinmentHistory(); 
    getStripeAccount();
    super.onInit();
  }
}
