import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_doctor_card.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 1),

      ///================= Appbar ====================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.schedule,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //===================== Calender ====================//
            Container(
              color: AppColors.whiteNormal,
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.multi,
                ),
                value: const [],
                onValueChanged: (dates) {},
              ),
            ),
//================= patient liat ================//
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: AvatarRow(avatars: [
            //     AppConstants.userNtr,
            //     AppConstants.userNtr,
            //     AppConstants.userNtr,
            //     AppConstants.userNtr,
            //     AppConstants.userNtr,
            //   ], extraCount: 30),
            // ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //================== Upcoming Text ================//
                      CustomText(
                        text: AppStrings.upcoming,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                      //===================== Reschedule Text ================//
                      CustomText(
                        text: AppStrings.reschedule,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                      //================== Upcoming text ===================//
                      CustomText(
                        text: AppStrings.upcoming,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayNormal,
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 25.h,
                  ),
                  ////========================= patient List ====================//
                  Column(
                    children: List.generate(5, (index) {
                      return CustomDoctorCard(
                        imageUrl: AppConstants.userNtr,
                        patentName: 'Heart Disease',
                        time: '05-12-24 (12:00 AM)',
                        loacation: '3 rue Paul Bert 75011 Paris',
                        onTap: () {},
                      );
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
