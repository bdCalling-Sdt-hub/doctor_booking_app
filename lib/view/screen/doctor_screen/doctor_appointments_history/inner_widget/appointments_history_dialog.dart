import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsHistoryDialog extends StatelessWidget {
  const AppointmentsHistoryDialog({
    super.key,
    required this.imageUrl,
    required this.patientName,
    required this.sickName,
    required this.appointmentFee,
    required this.contactNumber,
    required this.appointmentTime,
    required this.rated,
  });

  final String imageUrl;
  final String patientName;
  final String sickName;
  final String appointmentFee;
  final String contactNumber;
  final String appointmentTime;
  final String rated;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      // width: 335.w,
      decoration: BoxDecoration(
          color: AppColors.whiteNormal,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomImage(
                    imageSrc: AppIcons.close,
                    sizeWidth: 20,
                    imageColor: AppColors.blackNormal,
                  ),
                ),
              ],
            ),
            CustomNetworkImage(
              imageUrl: imageUrl,
              height: 45.h,
              width: 45.w,
              boxShape: BoxShape.circle,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              text: patientName,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: sickName,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: 'Appointment Fee: $appointmentFee',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: 'Contact Number: $contactNumber',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: 'Appointment time: $appointmentTime',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarker,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Rated:',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarker,
                ),
                SizedBox(
                  width: 12.h,
                ),
                const CustomImage(imageSrc: AppIcons.star),
                SizedBox(
                  width: 12.h,
                ),
                CustomText(
                  text: rated,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarker,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
