import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/forgot_password_api.dart';
import 'package:vendor_new_app/views/login_page/modal/forgotpassword.modal.dart';

class ForgotpasswordController extends BaseController {

  final TextEditingController PhoneNumberController = TextEditingController();
  final TextEditingController OTPController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmPasswordController = TextEditingController();

  ForgotPasswordApi forgpassApi = ForgotPasswordApi();
  ForgotPasswordSendOTPApi forgpassSendApi = ForgotPasswordSendOTPApi();
  ForgotPasswordVerifyOTPApi forgpassverifyApi = ForgotPasswordVerifyOTPApi();
  ForgotPasswordSendOTPModal? forgotPasswordSendOTPModal;
  int deniedCount = 0;

  final ValueNotifier isShow = ValueNotifier(false);

  var forgotpasswordOTPdata;

  getForgotPasswordApi(ForgotPasswordBody body) async {
    updateLoading(value: true);
    update();

    var forgotpasswordData = await forgpassApi.ForgotPassword(body);

    if (forgotpasswordData is CommonResponseModel) {
      showToustMessage2(message: forgotpasswordData.message ?? "");
      isShow.value = false;  // Hide password fields if API call fails
    } else {
      showToustMessage2(message: "Password Updated Successfully");
      Get.toNamed(AppRoutes.LoginScreen);
      return;
    }
  }

  getForgotPasswordSendOTPApi(ForgotPasswordSendOTPBody body) async {
    updateLoading(value: true);
    update();

    var data = await forgpassSendApi.ForgotSendOTP(body);

    if (data is CommonResponseModel) {
      showToustMessage2(message: data.message ?? "");
      isShow.value = false;  // Hide password fields if OTP sending fails
    } else {
      showToustMessage2(message: "OTP Sent to Mobile Number");
      forgotPasswordSendOTPModal = data;
      print(data);
      update();
      return;
    }
  }

  getForgotPasswordVerifyOTPApi(ForgotPasswordVerfiyOTPBody body) async {
    updateLoading(value: true);
    update();

    var verifyOTPresponseData = await forgpassverifyApi.ForgotPasswordVerifyOTP(body);

    if (verifyOTPresponseData is CommonResponseModel) {
      showToustMessage2(message: verifyOTPresponseData.message ?? "");
      isShow.value = false;  
      update();
    } else {
      showToustMessage2(message: "OTP verified Successfully");
      isShow.value = true; 
      update();
    }
  }
}
