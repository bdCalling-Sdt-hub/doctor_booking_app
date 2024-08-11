import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final Widget container;
  final String title;
  final String description;
  final String time;

  const NotificationItem({
    super.key,
    required this.container,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        container,
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: AppColors.blackNormal,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: CustomText(
                      text: description,
                      color: AppColors.blackNormal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: CustomText(
                      left: 8,
                      text: time,
                      color: AppColors.blackNormal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ],
    );
  }
}
