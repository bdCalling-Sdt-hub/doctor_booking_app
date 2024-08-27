import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_notification_screen/innar_widget.dart/doctor_notification_card.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_image/custom_image.dart';
import 'package:doctor_booking/view/widgets/custom_loader/custom_loader.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:doctor_booking/view/widgets/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorNotificationScreen extends StatelessWidget {
  DoctorNotificationScreen({super.key});

  final NotificationController notificationController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteNormal,
      bottomNavigationBar: const DoctorNavBar(currentIndex: 3),
      //================= app bar =================//
      appBar: const CustomAppBar(
        appBarContent: AppStrings.notifications,
      ),

      //============= body ===========//
      body: Obx(() {
        switch (notificationController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(onTap: () {
              notificationController.getAllDoctorNotification();
            });
          case Status.internetError:
            return const CustomLoader();
          case Status.completed:
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),

                        ///=================== to day & mark all text =============//
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: AppStrings.notificationToday,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteDarkActive,
                              ),
                              CustomText(
                                text: AppStrings.markAllAsRead,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grayNormal,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //=================== notifications ===================///
                        Column(
                          children: List.generate(
                            notificationController
                                .doctorNotificationList.length,
                            (index) => DoctorNotificationCard(
                              container: const CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.blackLight,
                                child: CustomImage(
                                  imageSrc: AppIcons.calendarClock,
                                  sizeWidth: 24,
                                ),
                              ),
                              title: notificationController
                                      .doctorNotificationList[index].title ??
                                  '',
                              description: notificationController
                                      .doctorNotificationList[index].body ??
                                  '',
                              time: '2h',
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //========================== yester day notification ====================//
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: AppStrings.notificationYesterday,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteDarkActive,
                              ),
                              CustomText(
                                text: AppStrings.markAllAsRead,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grayNormal,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Column(
                          children: List.generate(
                            2,
                            (index) => DoctorNotificationCard(
                              container: const CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.blackLight,
                                child: CustomImage(
                                  imageSrc: AppIcons.calendarClock,
                                  sizeWidth: 24,
                                ),
                              ),
                              title: 'Appointment Success',
                              description:
                                  'You have successfully cancelled your appointment with Dr. David Patel.',
                              time: '2h',
                              onTap: () {
                                notificationController.showNotificationPopup();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}
