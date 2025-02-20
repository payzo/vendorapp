
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/api/api_constant.dart';


class MybusinessApi extends ApiServiceProvider {
  dynamic vendorId = GetStorage().read('vendorId').toString();

Future<dynamic> getBusinessByUserIdApi() async {
  try {
    
    if (vendorId == null || vendorId.isEmpty) {
      throw 'Vendor ID is missing';
    }

    

    var url = 'https://vendor.payzopartner.in/payzo-api/getBusinessesByUserId/$vendorId';
    var mybusinessresponse = await getMethod(url);

    print('API Response: $mybusinessresponse');  

    if (mybusinessresponse == null) {
      throw 'No response from the server';
    }

    if (mybusinessresponse['success'] == true) {
      return mybusinessresponse; 
    } else {
      throw 'Failed to fetch businesses: ${mybusinessresponse['message'] ?? 'Unknown error'}';
    }
  } catch (e) {
    print('Error occurred: $e');
    throw 'An error occurred: $e';
  }
}

}
