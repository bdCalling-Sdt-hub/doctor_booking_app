import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorNotificationCard extends StatelessWidget {
  final Widget container;
  final String title;
  final String description;
  final String time;
  final bool readed;
  final VoidCallback? onTap;

  const DoctorNotificationCard({
    super.key,
    required this.container,
    required this.title,
    required this.description,
    required this.time,
    this.onTap,
    required this.readed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        container,
        SizedBox(width: 10.w),
        Expanded(
          // Wrap the Column in an Expanded widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: title,
                    color: AppColors.blackNormal,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.w,
                  ),
                  CustomText(
                    left: 8,
                    text: time,
                    color: AppColors.blackNormal,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.w,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      textAlign: TextAlign.left,
                      text: description,
                      color: AppColors.blackNormal,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  if (readed == false)
                    Container(
                      height: 8.r,
                      width: 8.r,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.green),
                    )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
