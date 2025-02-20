import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/signup_api.dart';
import 'package:vendor_new_app/views/login_page/modal/signup.modal.dart';




class SignupController extends BaseController{

final TextEditingController NameController = TextEditingController();
final TextEditingController MobileNumberController = TextEditingController();
final TextEditingController OtpController = TextEditingController();
final TextEditingController PasswordController = TextEditingController();
final TextEditingController ConfirmPasswordController = TextEditingController();
final TextEditingController otpNumberController = TextEditingController();

final ValueNotifier isShow =  ValueNotifier(false);
SignupApi registerApi = SignupApi();
SendOTPApi sendotpsApi = SendOTPApi();
VerifyOTPApi verifyotpsApi = VerifyOTPApi();

int deniedCount = 0;

 getRegistartionApi(SignupBody body) async {
  updateLoading(value: true);
  update();

  var registrationData = await registerApi.Registration(body);

 if(registrationData is CommonResponseModel){
  showToustMessage2(message: registrationData.message??"");
 }else{
  showToustMessage2(message: "Business Registered Successfully..");
  await Get.toNamed(AppRoutes.LoginScreen);
  return;
 }
 }


 getSendOTPApi(SendOTPBody body) async{
  updateLoading(value: true);
  update();

  var sendOTPresponse = await sendotpsApi.SendOTP(body);

  if(sendOTPresponse is CommonResponseModel){
    showToustMessage2(message: sendOTPresponse.message?? "");
  } else{
    showToustMessage2(message: "OTP Sent Successfully");
    return;
  }

 }


 getVerifyOTPApi(VerifyOTPBody body) async{
  updateLoading(value: true);
  update();

  var verifyOTPresponse = await verifyotpsApi.VerifyOTP(body);

  if(verifyOTPresponse is CommonResponseModel){
    showToustMessage2(message: verifyOTPresponse.message??"");
    return;
  }else{
    showToustMessage2(message: "OTP Verified Successfully");
   isShow.value = true;
update();
    return;
  }

 }




}