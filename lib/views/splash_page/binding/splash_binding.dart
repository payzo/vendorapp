import 'package:get/get.dart';
import 'package:vendor_new_app/views/splash_page/controllers/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
    );
  }
}
