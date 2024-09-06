import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_images/app_images.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorPaymentScreen extends StatelessWidget {
  const DoctorPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.payment,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: AppStrings.creditDebitCards,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grayNormal,
            ),
            SizedBox(
              height: 20.h,
            ),
            PaymentCard(
              title: 'Dianne Russell',
              subTitle: "* * * *   * * * *   7498",
              deleteButton: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            AddNewButton(
              onTap: () {
                Get.toNamed(AppRoutes.informationScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddNewButton extends StatelessWidget {
  const AddNewButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 44.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1, color: AppColors.blackNormal)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomImage(
              imageSrc: AppIcons.addCircel,
              imageColor: AppColors.blackNormal,
              size: 24,
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomText(
              text: AppStrings.addNewCard,
              fontSize: 14.sp,
              color: AppColors.blackNormal,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.deleteButton});

  final String title;
  final String subTitle;
  final VoidCallback deleteButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomImage(
              imageSrc: AppImages.devitcard,
              imageType: ImageType.png,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: subTitle,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: deleteButton,
          child: const CustomImage(
            imageSrc: AppIcons.delete,
            imageColor: AppColors.blackNormal,
          ),
        )
      ],
    );
  }
}
