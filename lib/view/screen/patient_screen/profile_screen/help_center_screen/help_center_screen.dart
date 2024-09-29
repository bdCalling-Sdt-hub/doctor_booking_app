import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_help_appbar/custom_help_appbar.dart';
import 'package:doctor_booking/view/widgets/custom_help_card/custom_help_card.dart';
import 'package:doctor_booking/view/widgets/custom_help_question/custom_help_question.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final PaitentProfileController profileController =
      Get.find<PaitentProfileController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const PatientNavBar(currentIndex: 4),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///=======================Help Center Appbar=================
            CustomHelpAppBar(scaffoldKey: scaffoldKey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///======================FrequentyAsk ============================
                  const CustomText(
                    text: AppStrings.frequentlyAskedQuestions,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.grayNormal,
                    bottom: 12,
                  ),

                  ///======================Question Here=======================
                  // ...profileController.faqs.map((faqs) => CustomFAQCard(
                  //       question: faqs,
                  //       onTap: () {
                  //         // Handle FAQ tap
                  //       },
                  //     )),

                  CustomHelpQuestion(),
                  SizedBox(height: 20.h),

                  ///=========================Need More Help=================
                  const CustomText(
                    text: AppStrings.needMoreHelp,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.grayNormal,
                  ),
                  SizedBox(height: 10.h),

                  ///======================Calling====================

                 

                  CustomHelpCard(
                    contactText: 'Email us at info@ileratravelhealth.com',
                    subText: 'Our help line service is active: 24/7',
                    onTap: () {
                      //profileController.launchPhone('01731090564');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
