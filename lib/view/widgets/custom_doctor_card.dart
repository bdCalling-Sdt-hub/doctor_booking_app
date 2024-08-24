import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({
    super.key,
    required this.imageUrl,
    required this.patentName,
    required this.time,
    required this.loacation,
    required this.onTap,
    this.reScheduleButton,
    this.timeTextColor,
    this.showPopupButton = true,
  });

  final String imageUrl;
  final String patentName;
  final String time;
  final String loacation;
  final VoidCallback onTap;
  final VoidCallback? reScheduleButton;
  final Color? timeTextColor;
  final bool? showPopupButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.whiteNormal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //===============image ============///
                  CustomNetworkImage(
                    imageUrl: imageUrl,
                    height: 84.h,
                    width: 81.w,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///==============name==========///
                            CustomText(
                              text: patentName,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grayNormal,
                              bottom: 3,
                            ),

                            ///===============more icon =============

                            // IconButton(
                            //   onPressed:reScheduleButton ?? (){},
                            //   icon: const Icon(Icons.more_vert),
                            // ),
                          ],
                        ),
                        //==============time=============//
                        CustomText(
                          text: time,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: timeTextColor ?? AppColors.grayNormal,
                          bottom: 3,
                        ),

                        //==================loactions=============//
                        Row(
                          children: [
                            SizedBox(
                              width: 16.h, // Ensure width and height are set
                              child: const CustomImage(
                                imageSrc: AppIcons.location,
                                imageColor: AppColors.whiteDarker,
                              ),
                            ),
                            SizedBox(
                                width: 4
                                    .w), // Add spacing between location icon and text
                            CustomText(
                              text: loacation,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteDarker,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              showPopupButton!
                  ? Positioned(
                      right: -8.h,
                      top: -8.h,
                      child: PopupMenuButton<int>(
                        shadowColor: AppColors.white,
                        surfaceTintColor: AppColors.white,
                        color: AppColors.white,
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          // popupmenu item 1
                          PopupMenuItem(
                            value: 1,
                            // row has two child icon and text.
                            child: InkWell(
                              onTap: reScheduleButton,
                              child: const CustomText(
                                text: AppStrings.reschedule,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
