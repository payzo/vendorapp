
import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/views/login_page/modal/signup.modal.dart';


class SignupApi extends ApiServiceProvider{

Future<dynamic> Registration(SignupBody body) async {
  try {
    var registration = await postMethod('https://vendor.payzopartner.in/payzo-api/vendorsignup', body.toJson());
     print(registration);

     if(registration is CommonResponseModel){
      return registration;
     }else{
      return SignupModal.fromJson(registration);
     }
  } catch (e) {
    print(e);
  }
}
}


class SendOTPApi extends ApiServiceProvider{
  Future<dynamic> SendOTP(SendOTPBody body) async{
     try {
       var sendOTPresponse = await postMethod('https://vendor.payzopartner.in/payzo-api/vendorSendOTP', body.toJson());
       print(sendOTPresponse);


       if(sendOTPresponse is CommonResponseModel){
        return sendOTPresponse;
       }else{
         return SendOTPModal.fromJson(sendOTPresponse);
       }
     } catch (e) {
       
     }
  }
}

class VerifyOTPApi extends ApiServiceProvider{
  Future<dynamic> VerifyOTP(VerifyOTPBody body) async{
    try {
      
      var verifyOTPresponse = await postMethod('https://vendor.payzopartner.in/payzo-api/verifyVendorOTP', body.toJson());
      print(verifyOTPresponse);


      if(verifyOTPresponse is CommonResponseModel){
        return verifyOTPresponse;
      }else{
        return VerifyOTPModal.fromJson(verifyOTPresponse);
      }


    } catch (e) {
      print(e);
    }
  }
}