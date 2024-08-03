
import 'package:get/get.dart';
import 'package:track_booking/view/screen/profile_screen/profile_controller/profile_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => ProfileController(), fenix: true);


  }
}
