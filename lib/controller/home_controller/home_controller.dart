import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ///================================BannerImage=========================
  final List<String> bannerImg = [
    AppImages.bannerOne,
    AppImages.bannerOne,
    AppImages.bannerOne,
  ];
  final List<Map<String, String>> categoriesList = [
    {"image": AppConstants.dentist, "name": "Dentist"},
    {"image": AppConstants.neurologist, "name": "Neurologist"},
    {"image": AppConstants.other, "name": "Cardiologist"},
    {"image": AppConstants.dentist, "name": "Dentist"},
    {"image": AppConstants.neurologist, "name": "Neurologist"},
    {"image": AppConstants.other, "name": "Cardiologist"},
  ];
  final RxString _selectedOption = 'Health Professional'.obs;

  String get selectedOption => _selectedOption.value;

  void setSelectedOption(String value) {
    _selectedOption.value = value;
  }

  RxInt bannerIndex = 0.obs;
  Rx<PageController> pageController = PageController().obs;
}
