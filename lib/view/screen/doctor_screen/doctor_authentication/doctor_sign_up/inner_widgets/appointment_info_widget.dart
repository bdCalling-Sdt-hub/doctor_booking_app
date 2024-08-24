import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_from_card/custom_from_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentInfoWidget extends StatelessWidget {
  const AppointmentInfoWidget({
    super.key,
    required this.dayName,
    required this.startTimeTap,
    required this.endTimeTap,
    required this.availableTab,
  });

  final String dayName;
  final VoidCallback startTimeTap;
  final VoidCallback endTimeTap;
  final VoidCallback availableTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '${AppStrings.dayOfWeek}: $dayName',
          fontSize: 16.sp,
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
                readOnly: true,
                hintText: 'Input time',
                hasBackgroundColor: true,
                title: AppStrings.startTime,
                controller: TextEditingController(),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: 5.h,
            ),
            Flexible(
              child: CustomFormCard(
                hintText: 'Input time',
                hasBackgroundColor: true,
                title: AppStrings.endTime,
                controller: TextEditingController(),
                readOnly: true,
                hasSuffixIcon: false,
                onTap: () {},
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
          onTap: () {},
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
