
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/views/login_page/modal/login.modal.dart';


class LoginApi extends ApiServiceProvider{



Future<dynamic> LoginMainApi(LoginBody body) async {
  try {
  
    var data = await postMethod('https://vendor.payzopartner.in/payzo-api/vendorlogin', body.toJson());
    
    print('Response data: $data'); 

    if (data != null && data['User'] != null && data['User'].isNotEmpty) {
      var userData = data['User'][0];


      print('userData: $userData');

      LoginModal userModal = LoginModal.fromJson(data);

      if (userModal.user != null && userModal.user!.isNotEmpty) {
        dynamic vendorId = userModal.user![0].vendorId; 
        print('Extracted vendorId: $vendorId');
        
        final box = GetStorage();
        box.write('vendorId', vendorId);
      } else {
        print('No users found in userModal');
      }
      
      return userModal;

    } else {
      print('No user data found or data is not in expected format');
      return 'No user data found'; 
    }

  } catch (e) {
    print('Error Getting User Data: $e'); 
    return null; 
  }
}


}



