import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_screen_one/onboard_screen_one.dart';
import 'onboard_screen_three/onboard_screen_three.dart';
import 'onboard_screen_two/onboard_screen_two.dart';

class OnboardScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homeController.pageControllers,
        children: [
          OnboardScreenOne(), // First onboarding screen
          OnboardScreenTwo(), // Second onboarding screen
          OnboardScreenThree(), // Third onboarding screen
        ],
      ),
    );
  }
}
