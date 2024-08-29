import 'package:doctor_booking/controller/calls_controller.dart/calls_controller.dart';
import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/controller/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/controller/hospital_controller/hospital_controller.dart';
import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/controller/patient_appointment_controller/patient_appointment_controller.dart';
import 'package:doctor_booking/controller/patient_auth_controller/patient_auth_controller.dart';
import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => HospitalController(), fenix: false);
    Get.lazyPut(() => PatientAppointmentController(), fenix: true);

    ///========================== Doctor Home section ==================

    Get.lazyPut(() => DoctorHomeController(), fenix: true);

    //=========================== General Controller ==============//

    Get.lazyPut(() => GeneralController(), fenix: true);
    //============== Call Controller ===================//
    Get.lazyPut(() => CallsController(), fenix: true);

    //=================== Doctor Schedule Controller =====================//

    Get.lazyPut(() => DoctorScheduleController(), fenix: true);

    //=============== Doctor Auth Controller =======================///

    Get.lazyPut(() => DoctorAuthController(), fenix: true);

    //=============== Patient Auth Controller ==================//

    Get.lazyPut(() => PatientAuthController(), fenix: true);

    //=============== Patient Home Controller ==================//
    Get.lazyPut(() => PaitentHomeController(), fenix: true);
  }
}
