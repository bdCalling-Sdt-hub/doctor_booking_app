import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHelpAppBar extends StatelessWidget {
  const CustomHelpAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppColors.blackNormal,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          ///====================================Top Section================================
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              IconButton(
                icon: const CustomImage(
                  imageSrc: AppIcons.arrowLeft,
                  imageColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const CustomText(
                text: AppStrings.helpCenter,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),

          ///======================How Can We Help YOu ============================
          const CustomText(
            text: AppStrings.howCanWeHelpYou,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.white,
          ),
          SizedBox(
            height: 16.h,
          ),

          ///====================================Search Section================================

          CustomTextField(
            fillColor: AppColors.white,
            onTap: () {
              // Get.toNamed(AppRoutes.searchScreen);
            },
            hintText: AppStrings.searchYourQuestionHere,
            isPrefixIcon: true,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.whiteDarker,
            ),
          ),
        ],
      ),
    );
  }
}
