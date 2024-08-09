import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const CustomImage(
              imageSrc: AppImages.ilera,
              imageType: ImageType.png,
            ),
            const CustomText(
              top: 32,
                text: AppStrings.choseYourRole,
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColors.grayNormal),
            CustomButton(
              title: AppStrings.continues,
                onTap: (){
              Get.toNamed(AppRoutes.signInScreen);

            })
          ],
        ),
      ),
    );
  }
}
