import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCallHistory extends StatelessWidget {
  final String image;
  final String name;
  final String date;

  const CustomCallHistory(
      {super.key, required this.image, required this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomNetworkImage(
              boxShape: BoxShape.circle,
              imageUrl: image,
              height: 55.h, // Use ScreenUtil for responsive height
              width: 55.w, // Use ScreenUtil for responsive width
            ),
            SizedBox(
              width: 16.w, // Use ScreenUtil for responsive width
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    color: AppColors.grayNormal,
                    fontSize: 12.sp, // Use ScreenUtil for responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: date,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp, // Use ScreenUtil for responsive font size
                    color: AppColors.grayNormal,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.w, // Adjusted for consistency
            ),
            const CustomImage(
              imageSrc: AppIcons.videoCammera,
              imageColor: AppColors.grayNormal,
            ),
            SizedBox(
              width: 16.w, // Consistent spacing
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
