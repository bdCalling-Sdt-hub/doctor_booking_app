import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';


class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 64),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
        color: AppColors.selectNavbarColor,
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          ///================================ APP LOGO ==============================///


          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    ///====================== My Profile ======================>




                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}