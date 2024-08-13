import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchedulePatientList extends StatelessWidget {
  const SchedulePatientList({
    super.key,
    required this.patientImageList,
    this.onTap,
  });

  final List<String> patientImageList;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.whiteNormal,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 18.0.h,
          top: 8.h,
          bottom: 8.h,
        ),
        child: Row(
          children: List.generate(
            9,
            (index) => Align(
              widthFactor: .6,
              child: index == 8
                  ? listLength(20, onTap ?? () {})
                  : CustomNetworkImage(
                      imageUrl: AppConstants.userNtr,
                      height: 54.h,
                      width: 54.w,
                      boxShape: BoxShape.circle,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  listLength(int length, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: 54.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: CustomText(
          text: '$length+',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.grayNormal,
        ),
      ),
    );
  }
}
