
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_screen_one/onboard_screen_one.dart';
import 'onboard_screen_three/onboard_screen_three.dart';
import 'onboard_screen_two/onboard_screen_two.dart';

class OnboardScreen extends StatelessWidget {
  final PaitentHomeController homeController = Get.find<PaitentHomeController>();

  OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView(
          clipBehavior: Clip.none,
          controller: homeController.pageController.value,
          children: [
            OnboardScreenOne(), // First onboarding screen
            OnboardScreenTwo(), // Second onboarding screen
            OnboardScreenThree(),
            // Third onboarding screen
          ],
        );
      }),
    );
  }
}
