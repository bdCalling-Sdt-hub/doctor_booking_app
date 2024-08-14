import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/appointments_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/favorite_screen/favorite_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/location_screen/location_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/profile_screen.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PatientNavBar extends StatefulWidget {
  final int currentIndex;

  const PatientNavBar({required this.currentIndex, super.key});

  @override
  State<PatientNavBar> createState() => _PatientNavBarState();
}

class _PatientNavBarState extends State<PatientNavBar> {
  var bottomNavIndex = 0;

  List<String> unselectedIcon = [
    AppIcons.homeUnselected,
    AppIcons.unselectedFavoriteIcon,
    AppIcons.hospitalUnselected,
    AppIcons.appointmentUnselected,
    AppIcons.profileUnselected,
  ];

  List<String> selectedIcon = [
    AppIcons.homeSelectedIcon,
    AppIcons.favoriteSelected,
    AppIcons.hospitalSelected,
    AppIcons.selectedAppointmentIcon,
    AppIcons.profileSelected,
  ];
  final List<String> userNavText = [
    AppStrings.home,
    AppStrings.favorite,
    AppStrings.hospitals,
    AppStrings.appointments,
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
      Get.offAll(() => HomeScreen());
    } else if (index == 1 && widget.currentIndex != 1) {
      Get.to(() => const FavoriteScreen());
    } else if (index == 2 && widget.currentIndex != 2) {
      Get.to(() => const LocationScreen());
    } else if (index == 3 && widget.currentIndex != 3) {
      Get.to(() => AppointmentsScreen());
    } else if (index == 4 && widget.currentIndex != 4) {
      Get.to(() => const ProfileScreen());
    }
  }
}
