import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PatientAuthController extends GetxController {
//====================== Get Patient Date of birth Method =================

  getPatientDateOfBirth() async {
    final DateTime? pickDate = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(1970),
        lastDate: DateTime.now());
    if (pickDate != null) {
      final formatDate = DateFormat.yMMMMd().format(pickDate);

      patientDateOfBirthController.value.text = formatDate;
    }
  }

  //=============================== Patient Sing up Controller ======================//
  TextEditingController patientNameController = TextEditingController();
  Rx<TextEditingController> patientDateOfBirthController =
      TextEditingController().obs;
  TextEditingController patientEmailController = TextEditingController();
  TextEditingController patientPhoneNumberController = TextEditingController();
  TextEditingController patientLoactionController = TextEditingController();
  TextEditingController patientPasswordController = TextEditingController();
  TextEditingController patientConfirmPasswordController =
      TextEditingController();
}
