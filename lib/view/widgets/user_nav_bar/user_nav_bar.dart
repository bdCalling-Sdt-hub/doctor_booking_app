import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/view/screen/home_screen/home_screen.dart';
import 'package:track_booking/view/screen/message_screen/message_screen.dart';
import 'package:track_booking/view/screen/profile_screen/profile_screen.dart';
import 'package:track_booking/view/screen/trip_screen/trip_screen.dart';

class UserNavBar extends StatefulWidget {
  final int currentIndex;

  const UserNavBar({required this.currentIndex, super.key});

  @override
  State<UserNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<UserNavBar> {
  var bottomNavIndex = 0;

  List<String> unselectedIcon = [

  ];

  List<String> selectedIcon = [

  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 66.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
              (index) => InkWell(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 6.h,
                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                color: index == bottomNavIndex ? AppColors.selectNavbarColor : null,
              ),
              child: SvgPicture.asset(
                index == bottomNavIndex ? selectedIcon[index] : unselectedIcon[index],
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index == 0 && widget.currentIndex != 0) {
      Get.offAll(() =>  HomeScreen());
    } else if (index == 1 && widget.currentIndex != 1) {
      Get.to(() => const TripScreen());
    } else if (index == 2 && widget.currentIndex != 2) {
      Get.to(() => const MessageScreen());
    } else if (index == 3 && widget.currentIndex != 3) {
      Get.to(() =>  ProfileScreen());
    }
  }
}
