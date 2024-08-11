import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImagePickerPopup extends StatelessWidget {
  const CustomImagePickerPopup({
    super.key,
    required this.galleryButton,
    required this.cammeraButton,
  });

  final VoidCallback galleryButton;
  final VoidCallback cammeraButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blackLight,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            InkWell(
              onTap: cammeraButton,
              child: SizedBox(
                child: Row(
                  children: [
                    Icon(Icons.camera,
                        size: 20.h, color: AppColors.blackNormal),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: AppStrings.cammera,
                      fontSize: 16.sp,
                      color: AppColors.blackNormal,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: galleryButton,
              child: SizedBox(
                child: Row(
                  children: [
                    Icon(Icons.image, size: 20.h, color: AppColors.blackNormal),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      text: AppStrings.gallery,
                      fontSize: 16.sp,
                      color: AppColors.blackNormal,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
