import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/modal/deletebusiness.modal.dart';

class DeletebusinessApi extends ApiServiceProvider {
  Future<dynamic> DeleteBusiness(DeleteBusinessBody body) async {
    try {
 
      var response = await deleteMethod(
        'https://vendor.payzopartner.in/payzo-api/deleteBusiness',
        body: body.toJson(),
      );
      
      print("API Response: $response");

      if (response is Map<String, dynamic>) {
        return DeleteBusinessModal.fromJson(response);
      } else if (response is CommonResponseModel) {
    
        return response; 
      } else {
     
        throw Exception('Unexpected response format');
      }
    } catch (e) {
 
      print("Error in DeleteBusiness API: $e");
      showToustMessage2(message: "An error occurred while deleting the business.");
      return null; 
    }
  }
}
