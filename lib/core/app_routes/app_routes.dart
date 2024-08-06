
import 'package:doctor_booking/view/screen/patient_screen/home_screen/home_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:doctor_booking/view/screen/patient_screen/splash_screen/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String splashScreen = "/SplashScreen";

  ///========================Home screen================
  static const String homeScreen = "/HomeScreen";

  ///==============================Profile section================
  static const String editProfileScreen = "/EditProfileScreen";
  // static const String profileScreen = "/ProfileScreen";


  static List<GetPage> routes = [
     GetPage(name: splashScreen, page: () => const SplashScreen()),

    ///========================Home screen================
     GetPage(name: homeScreen, page: () =>  HomeScreen()),

    ///==============================Profile section================
    GetPage(name: editProfileScreen, page: () =>  EditProfileScreen()),
    // GetPage(name: profileScreen, page: () =>  ProfileScreen()),

  ];
}
