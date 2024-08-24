import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class DoctorScheduleController extends GetxController {
  List<String> scheduleTabs = [
    AppStrings.upcoming,
    AppStrings.reschedule,
    AppStrings.past,
  ];

  RxInt tabCurrentIndex = RxInt(0);
}
