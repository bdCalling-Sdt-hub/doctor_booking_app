import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/call_screen/call_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_notification_screen/doctor_notification_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/schedule_screen.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DoctorNavBar extends StatefulWidget {
  final int currentIndex;

  const DoctorNavBar({required this.currentIndex, super.key});

  @override
  State<DoctorNavBar> createState() => _DoctorNavBarState();
}

class _DoctorNavBarState extends State<DoctorNavBar> {
  var bottomNavIndex = 0;

  List<String> unselectedIcon = [
    AppIcons.homeUnselected,
    AppIcons.scheduleUnselected,
    AppIcons.callUnselected,
    AppIcons.notification,
    AppIcons.profileUnselected,
  ];

  List<String> selectedIcon = [
    AppIcons.homeSelected,
    AppIcons.scheduleSelected,
    AppIcons.callSelected,
    AppIcons.notificationSelected,
    AppIcons.profileSelected,
  ];
  final List<String> userNavText = [
    AppStrings.home,
    AppStrings.schedule,
    AppStrings.calls,
    AppStrings.notification,
    AppStrings.profile
  ];
  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 95.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 13.h),
      // alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
          (index) => InkWell(
              onTap: () => onTap(index),
              child: Column(
                children: [
                  SvgPicture.asset(
                    index == bottomNavIndex
                        ? selectedIcon[index]
                        : unselectedIcon[index],
                    height: 24.h,
                    width: 24.w,
                  ),
                  CustomText(
                    top: 6,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    text: userNavText[index],
                    color: index == bottomNavIndex
                        ? AppColors.whiteDarkActive
                        : AppColors.whiteDarkActive,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index == 0 && widget.currentIndex != 0) {
      Get.offAll(() => DoctorHomeScreen());
    } else if (index == 1 && widget.currentIndex != 1) {
      Get.to(() => const ScheduleScreen());
    } else if (index == 2 && widget.currentIndex != 2) {
      Get.to(() => CallScreen());
    } else if (index == 3 && widget.currentIndex != 3) {
      Get.to(() => const DoctorNotificationScreen());
    } else if (index == 4 && widget.currentIndex != 4) {
      Get.to(() => const DoctorProfileScreen());
    }
  }
}
