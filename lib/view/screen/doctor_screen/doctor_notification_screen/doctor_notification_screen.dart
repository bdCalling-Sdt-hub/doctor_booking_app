import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_notification_screen/innar_widget.dart/doctor_notification_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorNotificationScreen extends StatelessWidget {
  const DoctorNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 3),
      //================= app bar =================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.notifications,
      ),

      //============= body ===========//
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),

                  ///=================== to day & mark all text =============//
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: AppStrings.notificationToday,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarkActive,
                        ),
                        CustomText(
                          text: AppStrings.markAllAsRead,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grayNormal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  //=================== notifications ===================///
                  Column(
                    children: List.generate(
                      3,
                      (index) => const DoctorNotificationCard(
                        container: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.blackLight,
                          child: CustomImage(
                            imageSrc: AppIcons.calendarClock,
                            sizeWidth: 24,
                          ),
                        ),
                        title: 'Appointment Success',
                        description:
                            'You have successfully cancelled your appointment with Dr. David Patel.',
                        time: '2h',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  //========================== yester day notification ====================//
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: AppStrings.notificationYesterday,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteDarkActive,
                        ),
                        CustomText(
                          text: AppStrings.markAllAsRead,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grayNormal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    children: List.generate(
                      2,
                      (index) => const DoctorNotificationCard(
                        container: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.blackLight,
                          child: CustomImage(
                            imageSrc: AppIcons.calendarClock,
                            sizeWidth: 24,
                          ),
                        ),
                        title: 'Appointment Success',
                        description:
                            'You have successfully cancelled your appointment with Dr. David Patel.',
                        time: '2h',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
