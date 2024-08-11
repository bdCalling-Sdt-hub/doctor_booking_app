import 'package:doctor_booking/utils/app_icons/app_icons.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final List<Map<String, dynamic>> notificationList = [
    {
      "title": "Appointment Success!",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventAvailable
    },
    {
      "title": "Appointment Remainder",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.calendarClock
    },
    {
      "title": "Appointment Canceled",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventBusy
    },
    {
      "title": "Payment Successful!",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.payments
    },
    {
      "title": "Schedule Changed",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.eventRepeat
    },
    {
      "title": "Share Your Experience ",
      "subtitle": 'Your appointment is confirmed',
      "time": '5:07 Am',
      'icon': AppIcons.review
    },
  ];
}
