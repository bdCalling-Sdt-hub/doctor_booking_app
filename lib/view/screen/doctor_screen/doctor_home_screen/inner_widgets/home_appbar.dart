import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class HomeAppbarDoctor extends StatelessWidget {
  const HomeAppbarDoctor({
    super.key,
    required this.loacation,
    required this.name,
    // required this.scaffoldKey,
  });

  final String loacation;
  final String name;
  // final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.whiteLightActive,
      margin: EdgeInsets.only(top: 32.h),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.blackDarker,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const CustomImage(
                      imageSrc: AppIcons.location,
                      imageColor: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        fontSize: 12.h,
                        color: AppColors.whiteDarker,
                      ),
                      CustomText(
                        text: loacation,
                        fontSize: 16.h,
                        color: AppColors.blackNormal,
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.blackNormal,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
