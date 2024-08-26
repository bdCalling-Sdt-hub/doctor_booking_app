import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorEditProfileImage extends StatelessWidget {
  const DoctorEditProfileImage(
      {super.key, required this.imageSrc, required this.onTap});

  final String imageSrc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomNetworkImage(
        imageUrl: imageSrc,
        height: 80.h,
        width: 80.w,
        borderRadius: BorderRadius.circular(45),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: InkWell(
          onTap: onTap,
          child: const CircleAvatar(
            radius: 17,
            backgroundColor: AppColors.blackNormal,
            child: Center(
              child: CustomImage(
                imageType: ImageType.png,
                imageSrc: AppIcons.gallary,
                sizeWidth: 18,
                imageColor: AppColors.white,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
