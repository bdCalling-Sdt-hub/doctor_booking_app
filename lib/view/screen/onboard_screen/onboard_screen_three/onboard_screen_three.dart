import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardScreenThree extends StatelessWidget {
  const OnboardScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomImage(
            imageSrc: AppImages.onBoardThree
            ,imageType: ImageType.png,
            fit: BoxFit.cover,),
          ///===========================Next Button==============
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomButton(onTap: (){
                  Get.toNamed(AppRoutes.chooseScreen);
                },
                  title: AppStrings.next,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
