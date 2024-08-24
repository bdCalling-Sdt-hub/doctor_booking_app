import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsHistoryCard extends StatelessWidget {
  const AppointmentsHistoryCard({
    super.key,
    required this.imageUrl,
    required this.patientName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.totalAmount,
    required this.amount,
    required this.onTap,
  });

  final String imageUrl;
  final String patientName;
  final String appointmentDate;
  final String appointmentTime;
  final String totalAmount;
  final String amount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        //height: 82.h,
        child: Padding(
          padding: EdgeInsets.all(14.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomNetworkImage(
                    imageUrl: imageUrl,
                    height: 54.h,
                    width: 59.w,
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: patientName,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayNormal,
                      ),
                      CustomText(
                        text: appointmentDate,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayNormal,
                      ),
                      CustomText(
                        text: appointmentTime,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayNormal,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: totalAmount,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayNormal,
                  ),
                  CustomText(
                    text: amount,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayNormal,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
