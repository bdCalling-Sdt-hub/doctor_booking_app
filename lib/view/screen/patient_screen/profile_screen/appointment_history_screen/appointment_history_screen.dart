import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_review_dialoge/custom_review_dialoge.dart';
import 'package:doctor_booking/view/widgets/customn_appointment_history/custom_appointment_history.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      bottomNavigationBar: const PatientNavBart(currentIndex: 4),

      ///==================swapHistory Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.appointmentHistory.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  children:List.generate(4, (index){
                    return     CustomAppointmentHistory(
                      onTapName: (){
                        // Get.toNamed(AppRoutes.otherProfile);
                      },
                      image: AppConstants.userNtr,
                      name: 'Zahid '.tr,
                      date: '12/06/24'.tr,
                      onTap: () {
                        showDialogBox(
                            context);
                      },
                      firstProductName: 'Samsung Galaxy S22'.tr,
                      exchangeProductName: 'Sony Y1G Android TV'.tr,
                    );
                  })
              )
            ],
          ),
        ),
      ),
    );
  }
  ///========================This is Accept Button Dialog box==============
  void showDialogBox(BuildContext context) {
    Get.dialog(
        CustomReviewDialog(
          commentController: TextEditingController(),
          onSubmit: (){
            Get.back();
          },
          initialRating:0, // Pass the initial rating value here
        )
    );
  }

}