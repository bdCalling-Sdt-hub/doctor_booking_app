import 'package:doctor_booking/view/screen/choose_screen/choose_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_appointments_history/doctor_appointments_history.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_personal_profile_screen/doctor_edit_personal_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_edit_professional_profile_screen/doctor_edit_professional_profile_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_screen.dart';
import 'package:doctor_booking/view/screen/doctor_screen/patient_details/patient_details.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_one/onboard_screen_one.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_three/onboard_screen_three.dart';
import 'package:doctor_booking/view/screen/onboard_screen/onboard_screen_two/onboard_screen_two.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/forget_password_screen/forget_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/reset_password_screen/reset_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_up_otp_screen/sign_up_otp_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/authentication/sign_up_screen/sign_up_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/call_history_screen/call_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/sub_categories_screen/sub_categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/hospital_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/notification_screen/notification_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/popular_specialists_screen/popular_specialists_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_edit_screen/account_edit_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_info_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/appointment_history_screen/appointment_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/help_center_screen/help_center_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/search_screen/search_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/setting_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:doctor_booking/view/screen/splash_screen/spalsh_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen";

  ///========================Home screen================
  static const String homeScreen = "/HomeScreen";

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

  static const String doctorEditPersonalProfileScreen =
      "/DoctorEditPersonalProfileScreen";
  static const String doctorEditProfessinalProfileScreen =
      "/DoctorEditProfessinalProfileScreen";

  //=================== Doctor appointments history ===================//

  static const String doctorAppointmentsHistory = "/DoctorAppointmentsHistory";

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
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: signUpOtpScreen, page: () => const SignUpOtpScreen()),
    GetPage(
        name: forgetPasswordScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: resetPasswordScreen, page: () => const ResetPasswordScreen()),

    ///=============================Hospital Section======================
    GetPage(name: hospitalScreen, page: () => HospitalScreen()),

    ///===============================OnBord Section=====================
    GetPage(name: onboardScreenOne, page: () => const OnboardScreenOne()),
    GetPage(name: onboardScreenTwo, page: () => const OnboardScreenTwo()),
    GetPage(name: onboardScreenThree, page: () => const OnboardScreenThree()),
    GetPage(name: chooseScreen, page: () => ChooseScreen()),

    ///==============================>>>>>>Doctor Section<<<<<<<========================
    //===================================home Section====================
    GetPage(name: doctorHomeScreen, page: () => DoctorHomeScreen()),
    GetPage(
        name: doctorEditPersonalProfileScreen,
        page: () => DoctorEditPersonalProfileScreen()),
    GetPage(
        name: doctorEditProfessinalProfileScreen,
        page: () => DoctorEditProfessionalProfileScreen()),
    GetPage(name: patientDetails, page: () => const PatientDetails()),

    //====================== Doctor appointments history ========================//

    GetPage(
        name: doctorAppointmentsHistory,
        page: () => DoctorAppointmentsHistory()),
  ];
}
