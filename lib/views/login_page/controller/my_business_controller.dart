import 'package:get/get.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/views/login_page/data/mybusiness_api.dart';
import 'package:vendor_new_app/views/login_page/modal/getAllBusiness.modal.dart';
import 'package:vendor_new_app/utils/display_utils.dart';

class MyBusinessController extends BaseController {
  MybusinessApi businessApi = MybusinessApi();

  RxList<Business> businesses = RxList<Business>();  
  RxBool isLoading = false.obs;  
  RxString errorMessage = ''.obs; 

  Future<void> getBusinessByUserApi() async {
    try {
      isLoading.value = true;
      update(); 

      var businessData = await businessApi.getBusinessByUserIdApi();  
      print("API Response: $businessData");  

      if (businessData is String) {
        errorMessage.value = businessData;
        showToustMessage2(message: businessData);
      } else {

        if (businessData != null && businessData['businesses'] != null && businessData['businesses'].isNotEmpty) {
          print("Success: ${businessData['success']}");
          print("Businesses Found: ${businessData['businesses'].length}");

          businesses.value = List<Business>.from(
            businessData['businesses'].map((x) => Business.fromJson(x)),  // Map the JSON data to Business objects
          );
          showToustMessage2(message: "Business fetched successfully!");  // Show success message
        } else {
          print("No businesses found in the API response");
          showToustMessage2(message: "No businesses found.");
        }
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
