import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/bigscreen_business_api.dart';
import 'package:vendor_new_app/views/login_page/modal/bigscreen.modal.dart';

class BigscreenController extends BaseController {

  BigscreenBusinessApi bigscreenapi = BigscreenBusinessApi();



  
  Rx<Business?> business = Rx<Business?>(null); 
  Rx<bool> isLoading = false.obs;
  RxString errorMessage = ''.obs;
  

  Future<void> getBusinessByBusinessIdApi() async {
    try {
      isLoading.value = true;
      update();

      final businessId = GetStorage().read('businessId');
      if (businessId == null) {
        throw 'Business ID is missing';
      }

      var bigbusinessData = await bigscreenapi.getBusinessByBusinessId();
      print("API Response: $bigbusinessData");

      if (bigbusinessData == null) {
        errorMessage.value = 'Business not found for the given ID';
        showToustMessage2(message: 'Business not found for the given ID');
      } else {
        business.value = bigbusinessData;
        showToustMessage2(message: "Business fetched successfully");
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
      showToustMessage2(message: 'An error occurred: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }



}



