
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/categories_screen/sub_categories_screen/sub_categories_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/hospital_screen/hospital_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/notification_screen/notification_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/popular_specialists_screen/popular_specialists_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_edit_screen/account_edit_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_info_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/appointment_history_screen/appointment_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/help_center_screen/help_center_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/search_screen/search_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/call_history_screen/call_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/setting_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/setting_screen/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/splash_screen/splash_screen.dart';
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

  ///===================Hospital Section====================
  static const String hospitalScreen = "/HospitalScreen";


  static List<GetPage> routes = [
     GetPage(name: splashScreen, page: () => const SplashScreen()),

    ///========================Home screen================
     GetPage(name: homeScreen, page: () =>  HomeScreen()),

    ///==============================Profile section================
    GetPage(name: helpCenterScreen, page: () =>  HelpCenterScreen()),
    GetPage(name: appointmentHistoryScreen, page: () =>  const AppointmentHistoryScreen()),
    GetPage(name: accountInfoScreen, page: () =>  const AccountInfoScreen()),
    GetPage(name: accountEditScreen, page: () =>   AccountEditScreen()),

    ///============================Home section================
    GetPage(name: searchScreen, page: () =>  const SearchScreen()),
    GetPage(name: notificationScreen, page: () =>   NotificationScreen()),
    GetPage(name: settingScreen, page: () =>    SettingScreen()),
    GetPage(name: changePasswordScreen, page: () =>    ChangePasswordScreen()),
    GetPage(name: privacyPolicyScreen, page: () =>    const PrivacyPolicyScreen()),
    GetPage(name: termsAndConditionScreen, page: () =>    const TermsAndConditionScreen()),
    GetPage(name: callHistoryScreen, page: () =>    const CallHistoryScreen()),
    GetPage(name: categoriesScreen, page: () =>     CategoriesScreen()),
    GetPage(name: subCategoriesScreen, page: () =>      const SubCategoriesScreen()),
    GetPage(name: popularSpecialistsScreen, page: () =>      const PopularSpecialistsScreen()),

    ///=============================Hospital Section======================
    GetPage(name: hospitalScreen, page: () =>    HospitalScreen()),

  ];
}
