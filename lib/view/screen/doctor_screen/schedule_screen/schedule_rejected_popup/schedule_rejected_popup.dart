import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScheduleRejectedPopup extends StatelessWidget {
  ScheduleRejectedPopup({super.key, required this.appointmentId});

  final String appointmentId;
  final DoctorScheduleController scheduleController =
      Get.find<DoctorScheduleController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomImage(
              imageSrc: AppIcons.close,
              size: 12,
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(),
            CustomText(
              text: 'Appointment Reject?',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackNormal,
              bottom: 10.h,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: CustomButton(
                height: 40,
                onTap: () {
                  scheduleController.appointmentStatusUpdate(
                      status: AppStrings.rejected,
                      appointmentId: appointmentId);
                },
                width: MediaQuery.sizeOf(context).width / 5,
                title: AppStrings.yes,
                fillColor: AppColors.whiteNormal,
                textColor: AppColors.red,
                isBorder: true,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: CustomButton(
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                },
                width: MediaQuery.sizeOf(context).width / 5,
                title: AppStrings.no,
                fillColor: AppColors.whiteNormal,
                textColor: AppColors.bluNormalHover,
                isBorder: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
