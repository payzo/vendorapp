import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/modal/bigscreen.modal.dart'; 

class BigscreenBusinessApi extends ApiServiceProvider {
  String? businessId = GetStorage().read('businessId').toString();

  // Fetch Business Details by Business ID
  Future<Business?> getBusinessByBusinessId() async {
    try {
      if (businessId == null || businessId!.isEmpty) {
        throw 'Business ID is missing';
      }

      var url = 'https://vendor.payzopartner.in/payzo-api/getBusinessById/$businessId';

      var bigbusinessResponse = await getMethod(url);

      print('Bigscreen API Response: $bigbusinessResponse');


      if (bigbusinessResponse != null && bigbusinessResponse['success'] == true) {
        var businessData = bigbusinessResponse['business'];
        return Business.fromJson(businessData);
      } else {
        throw 'Failed to fetch business data: ${bigbusinessResponse['message'] ?? 'Unknown error'}';
      }
    } catch (e) {
      print('Error occurred during API call: $e');
      throw 'An error occurred while fetching business data: $e';
    }
  }

  
  



}




