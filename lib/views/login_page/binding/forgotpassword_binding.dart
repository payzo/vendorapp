
import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/forgotpassword_controller.dart';

class ForgotpasswordBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> ForgotpasswordController()
    );
  }
}