import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/inner_widgets/doctor_home_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHomeController extends GetxController {
  RxString scheduleTime = RxString(AppStrings.today);

  // final RxList<String> scheduleOrCancel = [
  //   AppStrings.schedule,
  //   AppStrings.cancel
  // ];

  RxInt popupAvailableTimeCurrentIndex = RxInt(0);
  RxInt popupReschuduleCurrentIndex = RxInt(0);
  RxInt selectedIndex = RxInt(0);

  List<String> tabs = [AppStrings.schedule, AppStrings.cancel];
  RxInt tabSelectedIndex = RxInt(0);

  showHomePopup() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.whiteNormal,
        content: DoctorHomePopup(),
      ),
    );
  }
}
