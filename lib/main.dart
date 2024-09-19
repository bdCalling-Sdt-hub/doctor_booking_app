import 'package:doctor_booking/core/app_routes/app_routes.dart';
import 'package:doctor_booking/core/dependency/dependency_injection.dart';
import 'package:doctor_booking/service/api_url.dart';
import 'package:doctor_booking/service/socket_service.dart';
import 'package:doctor_booking/view/widgets/device_utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  DeviceUtils.lockDevicePortrait();
  Stripe.publishableKey = ApiUrl.stripePublicKey;
  SocketApi.init();
  runApp(const MyApp());
}

///TODO Change Pass. Delete Account

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoutes.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
