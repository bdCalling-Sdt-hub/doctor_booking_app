import 'package:doctor_booking/model/doctor_profile_model/doctor_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorProfileController extends GetxController {
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
    doctorDateOfBirthController.value.text =
        DateFormat.yMMMMd().format(model.dateOfBirth ?? DateTime.now());

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
}
