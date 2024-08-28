import 'dart:io';

import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorEditProfileImageNetwork extends StatelessWidget {
  const DoctorEditProfileImageNetwork(
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
        // borderRadius: BorderRadius.circular(45),
        boxShape: BoxShape.circle,
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

class DoctorEditProfileImageFile extends StatelessWidget {
  const DoctorEditProfileImageFile({
    super.key,
    required this.imageSrc,
    required this.onTap,
  });

  final String imageSrc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 80.h,
        width: 80.w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                File(imageSrc),
              ),
              fit: BoxFit.cover),
          shape: BoxShape.circle,
        ),
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
