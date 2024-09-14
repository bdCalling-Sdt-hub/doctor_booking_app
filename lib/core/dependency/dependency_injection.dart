import 'package:doctor_booking/controller/calls_controller.dart/calls_controller.dart';
import 'package:doctor_booking/controller/payment_controller/payment_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_auth_controller/doctor_auth_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_payment_screen/payment_controller/doctor_payment_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_controller/doctor_profile_controller.dart';
import 'package:doctor_booking/view/screen/doctor_screen/schedule_screen/doctor_schedule_controller/doctor_schedule_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/controller/hospital_controller.dart';
import 'package:doctor_booking/controller/notification_controller/notification_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/appointments_screen/controller/patient_appointment_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/patient_auth_controller/patient_auth_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/controller/profile_controller.dart';
import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/controller/paitent_home_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
    Get.lazyPut(() => PaitentProfileController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => HospitalController(), fenix: true);
    Get.lazyPut(() => PatientAppointmentController(), fenix: true);
    Get.lazyPut(() => PaitentPaymentController(), fenix: true);

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
    //===================== Doctor profile Controller ====================///

    Get.lazyPut(() => DoctorProfileController(), fenix: true);

    //=============== Patient Home Controller ==================//
    Get.lazyPut(() => PaitentHomeController(), fenix: true);
    //============== Doctor Payment controller ====================//
    Get.lazyPut(() => DoctorPaymentController(), fenix: true);
  }
}
