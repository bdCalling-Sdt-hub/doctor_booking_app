import 'dart:convert';

import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/service/api_check.dart';
import 'package:doctor_booking/service/api_client.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/utils/ToastMsg/toast_message.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaitentPaymentController extends GetxController {
  GeneralController generalController = Get.find<GeneralController>();
  PatientAppointmentController appointmentController =
      Get.find<PatientAppointmentController>();

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
      required String appoinmentDate,
      required String appoinmentId}) async {
    Map<String, dynamic>? paymentIntentData;
    try {
      navigator?.pop();
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
            appoinmentDate: appoinmentDate,
            amount: amount,
            appoinmentId: appoinmentId,
            doctorID: doctorID,
            getResponse: paymentIntentData,
            userID: userID);

        return instant;
      } else {
        return false;
      }
    } on StripeException catch (e) {
      navigator!.pop();
      // Specific Stripe error
      debugPrint("Stripe error: ${e.error.localizedMessage}");
      toastMessage(message: "Payment failed: ${e.error.localizedMessage}");
      return false;
    } catch (e, s) {
      navigator!.pop();
      // General error handling
      debugPrint("General error: ${e.toString()} -------- ${s.toString()}");
      toastMessage(message: "An error occurred: $e");
      return false;
    }
  }

  ///========================= Make Order =========================

  Future<bool> makeOrder(
      {required Map<String, dynamic>? getResponse,
      required int amount,
      required String userID,
      required String doctorID,
      required String appoinmentDate,
      required String appoinmentId}) async {
    Map<String, String> body = {
      "transitionId": getResponse?["transactionId"],
      "userId": userID,
      "doctorId": doctorID,
      "amount": amount.toString(),
      "AppointmentId": appoinmentId,
      "status": "success",
      "appointmentDate": appoinmentDate,

      //['pending', 'success', 'failed']
    };

    var response = await ApiClient.postData(
      ApiUrl.savePayment,
      jsonEncode(body),
    );

    if (response.statusCode == 200) {
      appointmentController.getMyAppoinment(status: AppStrings.accepted);
      toastMessage(message: response.body["message"], colors: Colors.green);

      navigator!.pop();
      return true;
    } else {
      ApiChecker.checkApi(response);
      navigator!.pop();
      return false;
    }
  }

//====================================== Doctor Payment History ================================//
}
