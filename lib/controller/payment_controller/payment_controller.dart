import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaitentPaymentController extends GetxController {
  GeneralController generalController = Get.find<GeneralController>();

  ///========================= Create Payment Intent =========================
  Future<Map<String, dynamic>?> createPaymentIntent({
    required int amount,
  }) async {
    generalController.showPopUpLoader();
    var response = await ApiClient.postData(
        ApiUrl.paymentIntent, jsonEncode({"amount": amount}));

    if (response.statusCode == 200) {
      return response.body["data"];
    } else {
      ApiChecker.checkApi(response);
      navigator!.pop();
      return null;
    }
  }

  ///========================= Make Payment =========================

  Future<bool> makePayment(
      {required int amount,
      required String userID,
      required String doctorID,
      required String appoinmentId}) async {
    Map<String, dynamic>? paymentIntentData;
    try {
      paymentIntentData = await createPaymentIntent(
        amount: amount,
      );
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Rafsan Hossain',
          paymentIntentClientSecret: paymentIntentData["clientSecret"],
          // customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
          // customerId: "id",
          allowsDelayedPaymentMethods: true,
          //style: ThemeMode.dark,
        ));
        await Stripe.instance.presentPaymentSheet();
        bool instant = await makeOrder(
            amount: amount,
            appoinmentId: appoinmentId,
            doctorID: doctorID,
            getResponse: paymentIntentData,
            userID: userID);

        return instant;
      } else {
        return false;
      }
    } catch (e, s) {
      navigator!.pop();

      debugPrint("Error2 ================>>>>>>>>>>>>>${e.toString()}");
      toastMessage(message: "Error $s");
      return false;
    }
  }

  ///========================= Make Order =========================

  Future<bool> makeOrder(
      {required Map<String, dynamic>? getResponse,
      required int amount,
      required String userID,
      required String doctorID,
      required String appoinmentId}) async {
    Map<String, String> body = {
      "transitionId": getResponse?["transactionId"],
      "userId": userID,
      "doctorId": doctorID,
      "amount": amount.toString(),
      "AppointmentId": appoinmentId,
      "status": "success"
      //['pending', 'success', 'failed'] this is  optional you dont need to pass them
    };

    var response = await ApiClient.postData(
      ApiUrl.savePayment,
      jsonEncode(body),
    );

    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);

      navigator!.pop();
      return true;
    } else {
      ApiChecker.checkApi(response);
      navigator!.pop();
      return false;
    }
  }
}
