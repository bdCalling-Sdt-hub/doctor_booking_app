import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorNotificationPopup extends StatelessWidget {
  const DoctorNotificationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              size: 16,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: CustomText(
            text: 'Reschedule request \ndeclined!',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
            bottom: 10.h,
            maxLines: 2,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomText(
          text: 'Decline Reason',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackNormal,
          bottom: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.whiteDarker,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 8.h),
            child: CustomText(
              textAlign: TextAlign.left,
              text:
                  'I will not available on that time. Please reschedule the appointment between 4:00 PM to 5:00 PM. Thank you. ',
              fontSize: 10.w,
              fontWeight: FontWeight.w500,
              color: AppColors.blackNormal,
              maxLines: 10,
            ),
          ),
        )
      ],
    );
  }
}
