import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.imageUrl,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
  });

  final String imageUrl;
  final String patientName;
  final String patientAge;
  final String patientGender;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNetworkImage(
              imageUrl: imageUrl,
              height: 64.h,
              width: 64.w,
              boxShape: BoxShape.circle,
            ),
            SizedBox(
              width: 13.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 18.h,
                // ),
                CustomText(
                  text: patientName,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grayNormal,
                ),
                CustomText(
                  text: '$patientAge || $patientGender',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayNormal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
