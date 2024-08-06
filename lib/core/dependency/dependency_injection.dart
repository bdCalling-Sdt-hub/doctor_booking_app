
import 'package:doctor_booking/view/screen/patient_screen/profile_screen/profile_controller/profile_controller.dart';
import 'package:get/get.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => ProfileController(), fenix: true);


  }
}
