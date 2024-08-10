import 'package:doctor_booking/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

class DoctorHomeController extends GetxController {
  RxString scheduleTime = RxString(AppStrings.today);

  // final RxList<String> scheduleOrCancel = [
  //   AppStrings.schedule,
  //   AppStrings.cancel
  // ];
  RxInt selectedIndex = RxInt(0);
}
