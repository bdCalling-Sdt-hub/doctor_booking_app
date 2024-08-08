import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';

import '../../../utils/app_icons/app_icons.dart';

void showDialogBox(BuildContext context, TextEditingController passwordController) {
  Get.dialog(
    AlertDialog(
      backgroundColor: AppColors.white,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CustomImage(
                    imageSrc: AppIcons.close,
                    imageType: ImageType.svg,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomText(
              left: 50,
              fontSize: 20.sp,
              text: AppStrings.deleteAccount,
              fontWeight: FontWeight.w500,
              color: AppColors.grayNormal,
              bottom: 10,
            ),
            CustomText(
              textAlign: TextAlign.start,
              text: AppStrings.areYouSureYouWantTo,
              fontWeight: FontWeight.w400,
              color: AppColors.grayNormal,
              fontSize: 14.sp,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            CustomText(
              text: "Password",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.blackO,
              bottom: 16,
            ),
            CustomTextField(
              hintText: "password",
              isPassword: true,
              fillColor: AppColors.whiteNormal,
              fieldBorderColor: AppColors.white,
              textEditingController: passwordController,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
                    ),
                    onPressed: () {
                      // Handle "Yes" action
                      Get.back();
                    },
                    child: CustomText(
                      text: AppStrings.yes,
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.green),
                    ),
                    onPressed: () {
                      // Handle "Cancel" action
                      Get.back();
                    },
                    child: CustomText(
                      text: AppStrings.cancel,
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
