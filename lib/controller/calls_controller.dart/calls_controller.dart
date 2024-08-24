import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CallsController extends GetxController {
  showCallsPopup() {
    return showDialog(
        barrierDismissible: true,
        context: Get.context!,
        builder: (_) {
          return SizedBox(
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Container(
                width: 181.w,
                height: 66.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: () {},
                  child: CustomText(
                    text: AppStrings.removeFromCallLog,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackNormal,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
