import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() async {
    // Fetch stored preferences using `await` for async values
    bool? isOnboarding =
        await SharePrefsHelper.getBool(AppConstants.onBoard) ?? false;

    bool? isRememberMe =
        await SharePrefsHelper.getBool(AppConstants.rememberMe) ?? false;

    String? token = await SharePrefsHelper.getString(AppConstants.bearerToken);

    String? role = await SharePrefsHelper.getString(AppConstants.role);

    // Logging the retrieved values for debugging purposes
    debugPrint(
        "From SplashScreen >>> Onboarding: $isOnboarding, RememberMe: $isRememberMe, Role: $role, HasToken: ${token.isNotEmpty}");

    // Navigate after 2 seconds delay
    await Future.delayed(const Duration(seconds: 2));

    // Logic checks and navigation
    if (token.isNotEmpty && isRememberMe) {
      // Navigate based on user role
      if (role == "USER") {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else if (role == "DOCTOR") {
        Get.offAllNamed(AppRoutes.doctorHomeScreen);
      } else {
        // Handle any unexpected roles if necessary
        Get.offAllNamed(AppRoutes.onboardScreenOne);
      }
    } else if (isOnboarding && token.isEmpty) {
      // If onboarding is complete but no token, set rememberMe and redirect to sign in
      await SharePrefsHelper.setBool(AppConstants.rememberMe, true);
      Get.offAllNamed(AppRoutes.signInScreen);
    } else {
      // Default onboarding screen
      Get.offAllNamed(AppRoutes.onboardScreenOne);
    }
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          ///=============================BackGround Image========================
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.splashScreen,
                    ))),
          ),

          ///========================This is loader=====================
          const Positioned.fill(top: 200, child: CustomLoader())
        ],
      )),
    );
  }
}
