import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/inner_widget.dart/patient_card.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/inner_widget.dart/patient_details_containert.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../service/api_url.dart';

// ignore: must_be_immutable
class PatientDetails extends StatelessWidget {
  PatientDetails({super.key});

  AppointmentModel model = Get.arguments;

  final DoctorScheduleController doctorScheduleController =
      Get.find<DoctorScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      //=================== app bar ===================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.patientDetails,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 9.h,
              ),
              //===================== patient card ==================//
              PatientCard(
                  imageUrl: "${ApiUrl.imageBaseUrl}${model.userId?.img}",
                  patientName: model.userId!.name!,
                  patientAge: model.userId?.age.toString() ?? '25',
                  patientGender: 'Male'),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.h),
                  child: CustomText(
                    text: model.reason ?? 'Reason not available',
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.h),
                  child: CustomText(
                    maxLines: 200,
                    textAlign: TextAlign.justify,
                    text: model.desc ?? 'Describe not available',
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

              if (model.prescription!.isNotEmpty) ...[
                CustomText(
                  text: AppStrings.attachReportsAndPrevious,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayNormal,
                ),
                SizedBox(
                  height: 9.h,
                ),
                //================= reports image ==============//

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      model.prescription!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CustomNetworkImage(
                          imageUrl:
                              "${ApiUrl.imageBaseUrl}${model.prescription?[index] ?? ''}",
                          height: 173.h,
                          width: 173.w,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              /// ====================== Services The Client Wants =====================
              const CustomText(
                text: "Requested Services",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                bottom: 18,
              ),

              ...List.generate(
                model.services?.length ?? 0,
                (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: model.services?[index].name ?? ""),
                      CustomText(
                          text: "£${model.services?[index].price ?? ""}"),
                    ],
                  );
                },
              )
            ],
          )),
    );
  }
}
