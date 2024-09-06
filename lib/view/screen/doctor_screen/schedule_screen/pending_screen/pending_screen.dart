import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/model/doctor_appointment_model/appointment_model.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_button/custom_button.dart';

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
  final DoctorHomeController homeController = Get.find<DoctorHomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        scheduleController.pendingAppointmentList.length,
        (index) {
          AppointmentModel model =
              scheduleController.pendingAppointmentList[index];
          return CustomDoctorPendingCard(
            showPopupButton: false,
            imageUrl: model.userId?.img ?? AppConstants.userNtr,
            patentName: model.userId?.name ?? '',
            time:
                '${model.date != null ? DateFormat.yMMMd().format(model.date!) : ''} (${model.time ?? ''})',
            loacation: model.userId?.location ?? '',
            onTap: () {},
            acceptButton: () {
              if (model.id != null) {
                scheduleController.appointmentStatusUpdate(
                  status: AppStrings.accepted,
                  appointmentId: model.id!,
                );
              }
            },
            rejectButton: () {
              if (model.id != null) {
                // scheduleController.appointmentStatusUpdate(
                //     status: AppStrings.rejected, appointmentId: model.id!);

                scheduleController.showRejectedPopup(id: model.id!);
              }
            },
            rescheduleButton: () {
              if (model.id != null) {
                homeController.showHomePopup(id: model.id!);
              }
            },
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
    this.morereScheduleButton,
    this.timeTextColor,
    this.showPopupButton = true,
    this.acceptButton,
    this.rejectButton,
    this.rescheduleButton,
  });

  final String imageUrl;
  final String patentName;
  final String time;
  final String loacation;
  final VoidCallback onTap;
  final VoidCallback? morereScheduleButton;
  final Color? timeTextColor;
  final bool? showPopupButton;
  final VoidCallback? acceptButton;
  final VoidCallback? rejectButton;
  final VoidCallback? rescheduleButton;

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
              Column(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
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
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomButton(
                          height: 40,
                          onTap: acceptButton ?? () {},
                          width: MediaQuery.sizeOf(context).width / 4,
                          title: AppStrings.accept,
                          fillColor: AppColors.white,
                          textColor: AppColors.green,
                          isBorder: true,
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          height: 40,
                          onTap: rejectButton ?? () {},
                          width: MediaQuery.sizeOf(context).width / 4,
                          title: AppStrings.reject,
                          fillColor: AppColors.white,
                          textColor: AppColors.red,
                          isBorder: true,
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          height: 40,
                          onTap: rescheduleButton ?? () {},
                          width: MediaQuery.sizeOf(context).width / 3,
                          title: AppStrings.reschedule,
                          fillColor: AppColors.white,
                          textColor: AppColors.bluNormalHover,
                          isBorder: true,
                        ),
                      )
                    ],
                  )
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
                              onTap: morereScheduleButton,
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
