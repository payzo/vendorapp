  import 'package:get/get.dart';
import 'package:vendor_new_app/views/login_page/controller/Dashboard_controller.dart';



  class DashboardBinding extends Bindings{
    @override
    void dependencies(){
      Get.lazyPut(
        ()=> DashboardController()
      );
    }
  }