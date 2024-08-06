import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:doctor_booking/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:doctor_booking/view/widgets/custom_container/custom_container.dart';
import 'package:doctor_booking/view/widgets/custom_notification/custom_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});

  final NotificationController notificationController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteLightActive,
      ///===========================Notification Appbar=-=================
      appBar: const CustomAppBar(
        appBarContent: AppStrings.notifications,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: List.generate(notificationController.notificationList.length, (index){
            return  NotificationItem(
              container: CustomContainer(
                iconSrc: notificationController.notificationList[index]['icon'],
              ),
              title: notificationController.notificationList[index]['title'],
              description: notificationController.notificationList[index]['subtitle'],
              time: notificationController.notificationList[index]['time'],
            );
          })
        ),
      ),
    );
  }
}
