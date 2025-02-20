

import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/views/login_page/modal/forgotpassword.modal.dart';


class ForgotPasswordApi extends ApiServiceProvider {
  Future<dynamic> ForgotPassword(ForgotPasswordBody body) async{
    try {
      var forgotpasswordResponse = await postMethod('https://vendor.payzopartner.in/payzo-api/forgotPassword-vendor', body.toJson());
      print(forgotpasswordResponse);

      if(forgotpasswordResponse is CommonResponseModel){
        return forgotpasswordResponse;
      }else{
        return ForgotPasswordModal.fromJson(forgotpasswordResponse);
       
      }
    } catch (e) {
      print(e);
    }
  }
}


class ForgotPasswordSendOTPApi extends ApiServiceProvider {
  Future<dynamic> ForgotSendOTP(ForgotPasswordSendOTPBody body) async {
    try {
      var forgotPasswordSendOTPresponse = await postMethod(
        'https://vendor.payzopartner.in/payzo-api/forgotpassword-sendOTP',
        body.toJson(),
      );
      print(forgotPasswordSendOTPresponse);
      if (forgotPasswordSendOTPresponse is CommonResponseModel) {
        return forgotPasswordSendOTPresponse;
      } else {
        ForgotPasswordSendOTPModal otpModal = ForgotPasswordSendOTPModal.fromJson(forgotPasswordSendOTPresponse);

        if (otpModal.userInformation != null) {
          var vendorId = otpModal.userInformation!.vendorId ?? 0;

          final box = GetStorage();
          box.write('vendorId', vendorId);
          print('Vendor ID: $vendorId');
        }
        return otpModal;
      }
    } catch (e) {

      print('Error during OTP request: $e');
  
      return null;
    }
  }
}

class ForgotPasswordVerifyOTPApi extends ApiServiceProvider{
  Future<dynamic> ForgotPasswordVerifyOTP(ForgotPasswordVerfiyOTPBody body)async {
    try {
      var verifyOTPsendResponse = await postMethod('https://vendor.payzopartner.in/payzo-api/verifyVendorOTP', body.toJson());
      print(verifyOTPsendResponse);

      if(verifyOTPsendResponse is CommonResponseModel){
        return verifyOTPsendResponse;
      }else{
        return ForgoPasswordVerfiyOTPModal.fromJson(verifyOTPsendResponse);
      }
    } catch (e) {
      print(e);
    }
  }
}