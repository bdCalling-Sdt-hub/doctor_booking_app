// ignore: file_names
import 'dart:io';

import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap,
      this.getFileImage = false,
      this.fileImagePath});

  // final PaymentController controller = Get.find<PaymentController>();

  final String text;
  final String image;
  final VoidCallback onTap;
  final bool? getFileImage;
  final String? fileImagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 91.h,
        width: 161.w,
        decoration: BoxDecoration(
          color: getFileImage! ? Colors.transparent : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 1, color: AppColors.blackNormal.withOpacity(.4)),
          image: getFileImage!
              ? DecorationImage(
                  image: FileImage(
                    File(fileImagePath!),
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                imageSrc: image,
                imageType: ImageType.svg,
                size: 18.sp,
                imageColor: AppColors.whiteDarker,
              ),
              CustomText(
                text: text,
                fontSize: 12.sp,
                color: AppColors.whiteDarkHover,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
