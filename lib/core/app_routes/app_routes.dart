
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/notification_screen/notification_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_edit_screen/account_edit_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/account_info_screen/account_info_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/appointment_history_screen/appointment_history_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/help_center_screen/help_center_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/search_screen/search_screen.dart';
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

  ];
}
