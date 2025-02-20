

import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/bigscreen_controller.dart';

class BigscreenBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> BigscreenController()
    );
  }
}