



import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/my_business_controller.dart';

class MybusinessBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> MyBusinessController()
    );
  }
}