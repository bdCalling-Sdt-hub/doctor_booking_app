import 'package:doctor_booking/view/screen/choose_screen/choose_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/all_patient_list_screean/all_patient_list_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/doctor_appointments_history.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_forget_password_screen/doctor_forget_password_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_reset_password_screen/doctor_reset_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/doctor_sign_up.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/appointment_info_screen/appointment_info_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/personal_info_screen/personal_info_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_authentication/doctor_sign_up/inner_widgets/professional_info_screen/professional_info_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_personal_profile_screen/doctor_edit_personal_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_professional_profile_screen/doctor_edit_professional_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_profile_screen/doctor_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/patient_details.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_one/onboard_screen_one.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_three/onboard_screen_three.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_two/onboard_screen_two.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/forget_password_screen/forget_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/reset_password_screen/reset_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/select_interest/select_interest.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_up_otp_screen/sign_up_otp_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_up_screen/sign_up_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/call_history_screen/call_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/sub_categories_screen/sub_categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/hospital_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/notification_screen/notification_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/patient_details_screen/patient_details_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/popular_specialists_screen/popular_specialists_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_edit_screen/account_edit_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_info_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/appointment_history_screen/appointment_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/help_center_screen/help_center_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/reschedule_appointmet_screen/reschedule_appoinment_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/search_screen/search_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/setting_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/specialist_profile/specialist_profile.dart';
import 'package:doctor_booking/view/screen/patient_screen/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:doctor_booking/view/screen/splash_screen/spalsh_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen";

  ///========================Home screen================
  static const String homeScreen = "/HomeScreen";
  static const String doctorProfileScreen = "/DoctorProfileScreen";
  static const String specialistProfile = "/SpecialistProfile";
  static const String bookAppointmentPatientDetails =
      "/BookAppointmentPatientDetails";

  ///==============================Profile section================
  static const String helpCenterScreen = "/HelpCenterScreen";
  static const String appointmentHistoryScreen = "/AppointmentHistoryScreen";
  static const String accountInfoScreen = "/AccountInfoScreen";
  static const String accountEditScreen = "/AccountEditScreen";

  ///===========================Home Section================
  static const String searchScreen = "/SearchScreen";
  static const String notificationScreen = "/NotificationScreen";
  static const String settingScreen = "/SettingScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String termsAndConditionScreen = "/TermsAndConditionScreen";
  static const String callHistoryScreen = "/CallHistoryScreen";
  static const String categoriesScreen = "/CategoriesScreen";
  static const String subCategoriesScreen = "/SubCategoriesScreen";
  static const String popularSpecialistsScreen = "/PopularSpecialistsScreen";

  ///===========================patient Authentication=====================

  static const String signInScreen = "/SignInScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String signUpOtpScreen = "/SignUpOtpScreen";
  static const String forgetPasswordScreen = "/ForgetPasswordScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String selectInterest = "/selectInterest";

  ///===================Hospital Section====================
  static const String hospitalScreen = "/HospitalScreen";

  ///=============================Onboard Section==================
  static const String onboardScreenOne = "/OnboardScreenOne";
  static const String onboardScreenTwo = "/OnboardScreenTwo";
  static const String onboardScreenThree = "/OnboardScreenThree";
  static const String chooseScreen = "/ChooseScreen";

  ///==============================>>>>>>Doctor Section<<<<<<<========================
  //===================================home Section====================
  static const String doctorHomeScreen = "/DoctorHomeScreen";
  static const String patientDetails = "/PatientDetails";

  //=============== Doctor edit profile section ===========-===//
  static const String doctorSignUp = "/DoctorSignUp";
  static const String doctorForgetPasswordScreen =
      "/DoctorForgetPasswordScreen";
  static const String doctorResetScreen = "/DoctorResetScreen";
  static const String appointmentInfoScreen = "/AppointmentInfoScreen";
  static const String personalInfoScreen = "/PersonalInfoScreen";
  static const String professionalInfoScreen = "/ProfessionalInfoScreen";
  static const String doctorEditPersonalProfileScreen =
      "/DoctorEditPersonalProfileScreen";
  static const String doctorEditProfessinalProfileScreen =
      "/DoctorEditProfessinalProfileScreen";

  //=================== Doctor appointments history ===================//

  static const String doctorAppointmentsHistory = "/DoctorAppointmentsHistory";

  //======================== All patient list screen =====================///

  static const String allPatientListScreen = "/AllPatientListScreen";
  static const String patientDetails2 = "/PatientDetailsScreen";
  //================= Reschedule Appointment Screen ===================//

  static const String rescheduleAppointmentScreen =
      "/RescheduleAppointmentScreen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),

    ///========================Home screen================
    GetPage(name: homeScreen, page: () => HomeScreen()),

    ///==============================Profile section================
    GetPage(name: helpCenterScreen, page: () => HelpCenterScreen()),
    GetPage(
        name: appointmentHistoryScreen,
        page: () => const AppointmentHistoryScreen()),
    GetPage(name: accountInfoScreen, page: () => const AccountInfoScreen()),
    GetPage(name: accountEditScreen, page: () => AccountEditScreen()),

    ///============================Home section================
    GetPage(name: searchScreen, page: () => const SearchScreen()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(
        name: termsAndConditionScreen,
        page: () => const TermsAndConditionScreen()),
    GetPage(name: callHistoryScreen, page: () => const CallHistoryScreen()),
    GetPage(name: categoriesScreen, page: () => CategoriesScreen()),
    GetPage(name: subCategoriesScreen, page: () => const SubCategoriesScreen()),
    GetPage(
        name: popularSpecialistsScreen,
        page: () => const PopularSpecialistsScreen()),

    ///================================patient Auth========================
    GetPage(name: signInScreen, page: () => SignInScreen()),
    // GetPage(name: onboardScreen, page: () => OnboardScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(
        name: doctorForgetPasswordScreen,
        page: () => const DoctorForgetPasswordScreen()),
    GetPage(name: signUpOtpScreen, page: () =>  SignUpOtpScreen()),
    GetPage(
        name: forgetPasswordScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: resetPasswordScreen, page: () => const ResetPasswordScreen()),
    GetPage(name: selectInterest, page: () =>  SelectInterest()),

    ///=============================Hospital Section======================
    GetPage(name: hospitalScreen, page: () => HospitalScreen()),

    ///===============================OnBord Section=====================
    GetPage(name: onboardScreenOne, page: () => OnboardScreenOne()),
    GetPage(name: onboardScreenTwo, page: () => OnboardScreenTwo()),
    GetPage(name: onboardScreenThree, page: () => OnboardScreenThree()),
    GetPage(name: chooseScreen, page: () => ChooseScreen()),
    GetPage(name: doctorProfileScreen, page: () => const DoctorProfileScreen()),
    GetPage(name: specialistProfile, page: () => const SpecialistProfile()),
    GetPage(
        name: rescheduleAppointmentScreen,
        page: () => const RescheduleAppoinmentScreen()),

    ///==============================>>>>>>Doctor Section<<<<<<<========================
    //===================================home Section====================
    GetPage(name: doctorHomeScreen, page: () => DoctorHomeScreen()),
    GetPage(name: doctorResetScreen, page: () => const DoctorResetScreen()),
    GetPage(
        name: doctorEditPersonalProfileScreen,
        page: () => DoctorEditPersonalProfileScreen()),
    GetPage(
        name: doctorEditProfessinalProfileScreen,
        page: () => DoctorEditProfessionalProfileScreen()),
    GetPage(name: patientDetails, page: () => const PatientDetails()),
    GetPage(name: doctorSignUp, page: () => DoctorSignUp()),
    GetPage(name: appointmentInfoScreen, page: () => AppointmentInfoScreen()),
    GetPage(name: personalInfoScreen, page: () => PersonalInfoScreen()),
    GetPage(name: professionalInfoScreen, page: () => ProfessionalInfoScreen()),

    //====================== Doctor appointments history ========================//

    GetPage(
        name: doctorAppointmentsHistory,
        page: () => DoctorAppointmentsHistory()),

    //===================== All patient list screen =====================//

    GetPage(
        name: allPatientListScreen, page: () => const AllPatientListScreen()),

    //========================== patient details =================///

    GetPage(name: patientDetails2, page: () => PatientDetailsScreen()),
  ];
}
