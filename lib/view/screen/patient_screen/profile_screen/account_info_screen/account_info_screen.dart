import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_container/custom_container.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const PatientNavBart(currentIndex: 4),

      backgroundColor: AppColors.whiteLightActive,
      appBar: const CustomAppBar(
        appBarContent: AppStrings.accountInfo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [

            const Row(
             children: [
               SizedBox(),
               Spacer(),
               CustomContainer(
                 routeName: AppRoutes.accountEditScreen,
                 iconSrc: AppIcons.borderColor,
               ),
             ],
           ),
            ///====================Image=================
            CustomNetworkImage(
                boxShape: BoxShape.circle,
                imageUrl: AppConstants.userNtr,
                height: 100,
                width: 100),

            ///=========================name==================
            const CustomText(
              top: 14,
              text: 'Mohammad Rakib',
              color: AppColors.grayNormal,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              bottom: 5,
            ),
            ///=========================Email==================
            const CustomText(
              text: 'rakibhossain12@gmail.com',
              color: AppColors.whiteDarker,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              bottom: 34,
            ),

            ///===========================Phone number================
            customAccountInfo(
                label: AppStrings.phoneNumber, value: '+3489 9999 9778'),

            ///===========================Date Of birth================
            customAccountInfo(label: AppStrings.dateOfBirth, value: '12/07/24'),

            ///===========================Gander================
            customAccountInfo(label: AppStrings.gender, value: 'Male'),

            ///===========================Location================
            customAccountInfo(
                label: AppStrings.location, value: 'California, USA'),
          ],
        ),
      ),
    );
  }

  Widget customAccountInfo({
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: label,
              color: AppColors.grayNormal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            const Spacer(),
            CustomText(
              text: value,
              color: AppColors.whiteDarker,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
