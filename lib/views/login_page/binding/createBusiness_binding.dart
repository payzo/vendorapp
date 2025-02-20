
import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/createBusiness_controller.dart';

class CreatebusinessBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(
      ()=> CreatebusinessController()
    );
  }
}