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
    bool isOnboarding =
        await SharePrefsHelper.getBool(AppConstants.onBoard) ?? false;

    String token = await SharePrefsHelper.getString(AppConstants.bearerToken);

    Future.delayed(const Duration(seconds: 2), () {
      if (isOnboarding || token.isEmpty || token == "null") {
        Get.offAllNamed(AppRoutes.signInScreen);
      } else {
        Get.offAllNamed(AppRoutes.onboardScreenOne);
      }
    });
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
