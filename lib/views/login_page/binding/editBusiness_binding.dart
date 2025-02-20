

import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/editBusiness_controller.dart';

class EditbusinessBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> EditbusinessController()
    );
  }
}