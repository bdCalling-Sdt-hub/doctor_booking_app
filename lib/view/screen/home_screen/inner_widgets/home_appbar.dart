import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

import '../../../../utils/app_const/app_const.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.appBarBackground,
      margin: EdgeInsets.only(
        top: 32.h,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          ///====================================Top Section================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///==================== Profile image =====================
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: AppConstants.userNtr,
                      height: 60,
                      width: 60),

                  SizedBox(
                    width: 16.w,
                  ),

                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '',
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                      ///=====================user name =======================
                      CustomText(
                        text: 'Masum Raj',
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                        color: AppColors.white,
                      )
                    ],
                  )
                ],
              ),
              ///==========================Drawer button ====================
              GestureDetector(
                  onTap: (){

                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const CustomImage(imageSrc: AppIcons.eye))

            ],
          ),
        ],
      ),
    );
  }
}
