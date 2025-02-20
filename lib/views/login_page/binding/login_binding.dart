import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/login_controler.dart';



class LoginBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> LoginControler());
    
  }
}