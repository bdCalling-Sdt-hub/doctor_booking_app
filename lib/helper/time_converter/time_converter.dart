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

  // static bool isWithin30Minutes(String time) {
  //   try {
  //     // Get the current time
  //     DateTime now = DateTime.now();

  //     // Trim any leading/trailing spaces from the input time string
  //     time = time.trim();

  //     // Create a DateFormat to parse the time (like "03:00 PM")
  //     DateFormat format =
  //         DateFormat('h:mm a'); // 'jm' handles time in "hh:mm AM/PM" format

  //     // Parse the input time string to a DateTime object
  //     DateTime parsedTime = format.parse(time);

  //     // Create a DateTime object for today's date with the parsed time
  //     DateTime targetTime = DateTime(
  //         now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);

  //     // Calculate 30 minutes after the target time
  //     DateTime time30MinutesAfter = targetTime.add(Duration(minutes: 30));

  //     // Return true if the current time is between targetTime and time30MinutesAfter (inclusive)
  //     return now.isAfter(targetTime) && now.isBefore(time30MinutesAfter) ||
  //         now.isAtSameMomentAs(targetTime);
  //   } catch (e) {
  //     // If any exception occurs (like a format error), return false
  //     print('Error parsing time: $e');
  //     return false;
  //   }
  // }
  // static bool isWithin30MinutesOfTime(
  //     {String dateString = "2024-09-10T00:00:00.000Z",
  //     String timeString = "05:18 PM"}) {
  //   try {
  //     // Define the format to parse the date and time together
  //     final dateTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z' h:mm a");

  //     // Parse the date part first (to handle ISO format like 2024-09-10T00:00:00.000Z)
  //     DateTime parsedDate = DateTime.parse(dateString);

  //     // Use the formatted date with the time string (e.g., "03:30 PM") to create a full DateTime
  //     String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  //     String dateTimeString = "$formattedDate $timeString";

  //     // Define another DateFormat to parse the combined string
  //     final combinedFormat = DateFormat('yyyy-MM-dd h:mm a');

  //     // Parse the combined string to get the full DateTime object
  //     DateTime inputDateTime = combinedFormat.parse(dateTimeString);

  //     // Get the current time
  //     DateTime now = DateTime.now();

  //     // Calculate 30 minutes after the input time
  //     DateTime thirtyMinutesAfter = inputDateTime.add(Duration(minutes: 30));

  //     // Check if the current time is between the target time and 30 minutes after
  //     return now.isAfter(inputDateTime) && now.isBefore(thirtyMinutesAfter) ||
  //         now.isAtSameMomentAs(inputDateTime);
  //   } catch (e) {
  //     // If any parsing errors occur, print the error and return false
  //     print('Error parsing date or time: $e');
  //     return false;
  //   }
  // }

  static bool isWithin30MinutesOfTime(
      String inputDateString, String inputTimeString) {
    // Clean the input time string by removing any extra spaces or invisible characters
    inputTimeString = inputTimeString.trim().replaceAll(RegExp(r'\s+'), ' ');

    // Parse the input date
    DateTime inputDate =
        DateTime.parse(inputDateString); // "2024-09-10T00:00:00.000Z"

    // Parse the time string ("05:18 PM") using DateFormat from intl package
    try {
      final DateFormat timeFormat =
          DateFormat('h:mm a'); // 'jm' is the pattern for '5:18 PM'
      final DateTime parsedTime = timeFormat.parse(inputTimeString);

      // Create a DateTime combining inputDate with parsed time
      DateTime inputDateTime = DateTime(
        inputDate.year,
        inputDate.month,
        inputDate.day,
        parsedTime.hour,
        parsedTime.minute,
      );

      // Add 30 minutes to the parsed time
      DateTime matchTimeWith30MinAdded =
          inputDateTime.add(const Duration(minutes: 30));

      // Get the current time
      DateTime now = DateTime.now();

      // if (!now.isAfter(inputDateTime) ||
      //     now.isBefore(inputDateTime.subtract(Duration(minutes: 2)))) {
      //   print('===============================> Hello');
      //   return false;
      // }

      // if (now.hour == inputDateTime.hour) {
      //   if (now.minute > matchTimeWith30MinAdded.minute) {
      //     return false;
      //   }

      //   if (now.minute >= inputDateTime.minute) {
      //     print(now.minute);
      //     print(inputDateTime.minute);
      //     return true;
      //   }
      // }

      //  Compare the current time with the input time and the time 30 minutes after it
      return now.isAfter(inputDateTime) &&
          now.isBefore(matchTimeWith30MinAdded);
    } catch (e) {
      debugPrint('Error parsing time string: $e');
      return false;
    }
  }

  static String formatDate(String isoDateString) {
    // Parse the ISO date string into a DateTime object
    DateTime parsedDate = DateTime.parse(isoDateString);

    // Format the DateTime object to "day-month-year"
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);

    return formattedDate;
  } 
 static String formatTime(String input) {
  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(input).toLocal(); // Convert to local timezone if needed

  // Format the DateTime into the desired time format (e.g., 10:00 PM)
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return formattedTime;
}
}
