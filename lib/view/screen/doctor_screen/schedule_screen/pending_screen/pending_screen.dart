import 'package:doctor_booking/controller/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';

import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PendingScreen extends StatelessWidget {
  PendingScreen({super.key});
  final DoctorScheduleController scheduleController =
      Get.find<DoctorScheduleController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        scheduleController.pendingAppointmentList.length,
        (index) {
          AppointmentModel model =
              scheduleController.pendingAppointmentList[index];
          return CustomDoctorPendingCard(
            imageUrl: model.userId?.img ?? AppConstants.userNtr,
            patentName: model.userId?.name ?? '',
            time:
                '${model.date != null ? DateFormat.yMMMd().format(model.date!) : ''} (${model.time ?? ''})',
            loacation: model.userId?.location ?? '',
            onTap: () {},
          );
        },
      ),
    );
  }
}

class CustomDoctorPendingCard extends StatelessWidget {
  const CustomDoctorPendingCard({
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
    return GestureDetector(
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
                    height: 121.h,
                    width: 97.w,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: patentName,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grayNormal,
                          bottom: 3,
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
