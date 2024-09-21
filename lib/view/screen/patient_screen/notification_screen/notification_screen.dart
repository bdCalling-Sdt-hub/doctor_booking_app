import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_circle_container/custom_circle_container.dart';
import 'package:doctor_booking/view/widgets/custom_notification/custom_notification.dart';
import 'package:doctor_booking/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController =
      Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLightActive,

      ///===========================Notification Appbar=-=================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.notifications,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: notificationController.doctorNotificationList.isEmpty
            ? const Center(child: CustomText(text: "No Notifications Yet"))
            : Column(
                children: List.generate(
                    notificationController.doctorNotificationList.length,
                    (index) {
                var data = notificationController.doctorNotificationList[index];
                return NotificationItem(
                  container: const CustomCircleContainer(
                    iconSrc: AppIcons.calendarClock,
                  ),
                  title: data.title ?? "",
                  description: data.body ?? "",
                  time: data.createdAt ?? "",
                );
              })),
      ),
    );
  }
}
