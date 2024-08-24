import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/inner_widget.dart/patient_card.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/inner_widget.dart/patient_details_containert.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      //=================== app bar ===================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.patientDetails,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9.h,
                  ),
                  //===================== patient card ==================//
                  PatientCard(
                    imageUrl: AppConstants.userNtr,
                    patientName: 'Mohammad Rakib',
                    patientAge: '25 years',
                    patientGender: 'Male',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    child: CustomText(
                      text: AppStrings.reasonOfVisit,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayNormal,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),

                  PatientDetailsContainer(
                    ///====================== reason of visit ==============//
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0.h, horizontal: 10.h),
                      child: CustomText(
                        text: 'Chronic pain issue- back pain',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayNormal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),

                  //================= Describe Problem  title =============//
                  SizedBox(
                    child: CustomText(
                      text: AppStrings.describeProblem,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayNormal,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  //================= Describe Problem =============//
                  PatientDetailsContainer(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0.h, horizontal: 10.h),
                      child: CustomText(
                        maxLines: 200,
                        textAlign: TextAlign.justify,
                        text:
                            'Ive been experiencing chronic back pain for the past six months. The pain started gradually without any clear injury or incident. It began as a dull ache in my lower back.',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayNormal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  //=============== atach reports & previous ==============///
                  SizedBox(
                    child: CustomText(
                      text: AppStrings.attachReportsAndPrevious,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayNormal,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  //================= reports image ==============//
                  Center(
                    child: CustomNetworkImage(
                      imageUrl: AppConstants.prescribtion,
                      height: 173.h,
                      width: 173.w,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),

                  /// ======================= call button ==============//
                  CustomButton(
                    title: AppStrings.calls,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
