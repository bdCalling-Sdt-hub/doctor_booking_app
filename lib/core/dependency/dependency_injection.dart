import 'package:doctor_booking/controller/calls_controller.dart/calls_controller.dart';
import 'package:doctor_booking/controller/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/controller/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/controller/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/controller/home_controller/home_controller.dart';
import 'package:doctor_booking/controller/hospital_controller/hospital_controller.dart';
import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/controller/patient_appointment_controller/patient_appointment_controller.dart';
import 'package:doctor_booking/controller/profile_controller/profile_controller.dart';
import 'package:doctor_booking/global/general_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => HospitalController(), fenix: false);
    Get.lazyPut(() => PatientAppointmentController(), fenix: false);

    ///========================== Doctor Home section ==================

    Get.lazyPut(() => DoctorHomeController(), fenix: false);

    //=========================== General Controller ==============//

    Get.lazyPut(() => GeneralController(), fenix: true);
    //============== Call Controller ===================//
    Get.lazyPut(() => CallsController(), fenix: false);

    //=================== Doctor Schedule Controller =====================//

    Get.lazyPut(() => DoctorScheduleController(), fenix: false);

    //=============== Doctor Auth Controller =======================///

    Get.lazyPut(() => DoctorAuthController(), fenix: true);
  }
}
