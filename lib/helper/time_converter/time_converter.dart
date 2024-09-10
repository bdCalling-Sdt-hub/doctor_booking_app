import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConverter {
  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  ///=============== Calculate Time of Day ===============

  static String getTimePeriod() {
    // Get the current hour of the day
    int currentHour = DateTime.now().hour;

    // Define the boundaries for morning, noon, and evening
    int morningBoundary = 6;
    int noonBoundary = 12;
    int eveningBoundary = 18;

    // Determine the time period based on the current hour
    if (currentHour >= morningBoundary && currentHour < noonBoundary) {
      return "Good Morning";
    } else if (currentHour >= noonBoundary && currentHour < eveningBoundary) {
      return "Good Noon";
    } else {
      return "Good Evening";
    }
  }

//================== Get Age =================

  static String getAge({required String dOB}) {
    // Parse the date of birth from the string input
    List<String> dobParts = dOB.split("-");
    int day = int.parse(dobParts[0]);
    int month = int.parse(dobParts[1]);
    int year = int.parse(dobParts[2]);

    // Create a DateTime object for the date of birth
    DateTime birthDate = DateTime(year, month, day);
    DateTime currentDate = DateTime.now();

    // Calculate age
    int age = currentDate.year - birthDate.year;

    // Adjust age if the birthday has not yet occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  ///======================= Calculate CreatedAt time and show it =========================

  static String formatTimeAgo(String dateTimeString) {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 1) {
      // If the time is more than 1 day ago, return the date in "dd MMM yyyy" format
      return '${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}';
    } else if (difference.inDays == 1) {
      // If the time is 1 day ago, return "Yesterday"
      return 'Yesterday';
    } else if (difference.inHours >= 1) {
      // If the time is today but more than an hour ago, return in hours ago format
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      // If the time is less than an hour ago, return in minutes ago format
      return '${difference.inMinutes}m ago';
    } else {
      // If the time is less than a minute ago, return "Just now"
      return 'Just now';
    }
  }

  // Helper method to get month name
  static String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  } 
 static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final format = DateFormat('h:mm a').format(DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute));
    return format;
  }
}
