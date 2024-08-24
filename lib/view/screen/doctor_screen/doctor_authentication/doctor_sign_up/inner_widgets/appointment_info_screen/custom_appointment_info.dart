import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppointmentInfo extends StatelessWidget {
  CustomAppointmentInfo({
    super.key,
    required this.dayName,
    required this.startTimeTap,
    required this.endTimeTap,
    required this.availableTab,
    this.startTimeHintText,
    this.endTimeHintText,
    this.startController,
    this.endController,
  });

  final String dayName;
  final VoidCallback startTimeTap;
  final VoidCallback endTimeTap;
  final VoidCallback availableTab;
  final String? startTimeHintText;
  final String? endTimeHintText;
  final TextEditingController? startController;
  final TextEditingController? endController;

  final DoctorAuthController doctorAuthController =
      Get.find<DoctorAuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '${AppStrings.daysOfWeek} $dayName',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grayNormal,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomText(
          text: AppStrings.availAbleTime,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.grayNormal,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Flexible(
              child: CustomFormCard(
                hasSuffixIcon: false,
                readOnly: true,
                hintText: startTimeHintText ?? 'Input time',
                hasBackgroundColor: true,
                title: 'Start Time',
                controller: startController ?? TextEditingController(),
                onTap: startTimeTap,
              ),
            ),
            SizedBox(
              width: 5.h,
            ),
            Flexible(
              child: CustomFormCard(
                hintText: endTimeHintText ?? 'Input time',
                hasBackgroundColor: true,
                title: 'End Time',
                controller: endController ?? TextEditingController(),
                readOnly: true,
                hasSuffixIcon: false,
                onTap: endTimeTap,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        // CustomText(
        //   text: AppStrings.availableFor,
        //   fontSize: 16.sp,
        //   fontWeight: FontWeight.w400,
        //   color: AppColors.grayNormal,
        // ),
        CustomFormCard(
          hintText: 'Online Appointment',
          hasBackgroundColor: true,
          title: AppStrings.availableFor,
          controller: TextEditingController(),
          readOnly: true,
          hasSuffixIcon: true,
          onTap: availableTab,
        ),

        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
