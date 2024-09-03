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
}
