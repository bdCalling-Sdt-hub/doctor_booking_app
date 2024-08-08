
import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/controller/hospital_controller/hospital_controller.dart';
import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:get/get.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => ProfileController(), fenix: true);
   Get.lazyPut(() => HomeController(), fenix: true);
   Get.lazyPut(() => NotificationController(), fenix: true);
   Get.lazyPut(() => HospitalController(), fenix: true);


  }
}
