
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/cString.dart';
import 'package:vendor_new_app/helper/constants/cTextFormField.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/signup_controller.dart';
import 'package:vendor_new_app/views/login_page/modal/signup.modal.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});


  final SignupController controller = Get.put(SignupController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>( builder: (controller) => 
      Scaffold(
         body:  Form(
          key: formkey,
           child: SingleChildScrollView(
            child: 
               Container(
            decoration: BoxDecoration(
              gradient: BackgroundGradient
            ),
            width: getWidth(context),
            height: getHeight(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
               vGap(17),
                Align(
                  alignment: Alignment.centerLeft,
                  
                  child: IconButton(
                    color: cWhiteColor,
                    onPressed: 
                  (){
                   Get.toNamed(AppRoutes.initialScreen);
                  }, icon: Icon(
                    Icons.arrow_back
                  )),
                ),
                vGap(20),
              
                Text(CStrings.RegistrationTilte, style: TextStyle(fontSize: 27, color: cWhiteColor),),
                vGap(20),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(
                    obsecureText: false,
                    controller: controller.NameController,
                  hintText: 'Please Enter Your Name',
                  inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                               ],
                  ),
                ),
                 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(obsecureText: false,
                  hintText: 'Please Enter Mobile Number',
                  controller: controller.MobileNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                               ],
                  suffixIcon: CButton(
                    onPressed: () async{
                      if(formkey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                        formkey.currentState!.save();

                        if(controller.MobileNumberController.text.isEmpty){
                          showToustMessage2(message: 'Please Enter Mobile Number');
                        }else{
                           SendOTPBody body = SendOTPBody(
                            phoneNumber: controller.MobileNumberController.text
                           );
                           await controller. getSendOTPApi(body);
                        }
                      }

                    },
                    width: getWidth(context)/3,
                   
                    text: Text('send OTP')),
                  ),
                ),
                 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(obsecureText: false,
                  hintText: 'Please Enter OTP',
                  controller: controller.OtpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                               ],
                  suffixIcon: CButton(
                    onPressed: () async{
                      if(formkey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                        formkey.currentState!.save();


                      if(controller.OtpController.text.isEmpty){
                        showToustMessage(context, 'Please Enter OTP');
                      }else{
                        VerifyOTPBody body = VerifyOTPBody(
                          phoneNumber: controller.MobileNumberController.text,
                          otp: controller.OtpController.text
                        );

                        await controller.getVerifyOTPApi(body);
                      }


                      }
                    },
                    width: getWidth(context)/3,
                   
                    text: Text('Verify OTP')),
                  ),
                ),
                 
                 
                 
               controller.isShow.value == true? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(
                    obsecureText: true,
                    controller: controller.PasswordController,
                     hintText: 'Enter Your Password'
                     ),
                ):Container(),
                 
                  controller.isShow.value == true? Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CTextFormField(
                     obsecureText: true,
                     controller: controller.ConfirmPasswordController,
                     keyboardType: TextInputType.emailAddress,
                     hintText: 'Re-Enter Your Password',
                     
                     ),
                   ):Container(),
                   vGap(20),
                 
                 
                  controller.isShow.value == true ? Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CButton(
                      borderRadius: 10,
                      color: Colors.white,
                      width: getWidth(context)/1,
                      height: getHeight(context)/18,
                       onPressed: () async{
                        if(formkey.currentState!.validate()){
                          FocusScope.of(context).unfocus();
                          formkey.currentState!.save();

                          if(controller.NameController.text.isEmpty){
                            showToustMessage(context, 'Please Enter Full Name');
                          } else if(controller.MobileNumberController.text.isEmpty){
                            showToustMessage(context, 'Please Enter Mobile Number');
                          } else if(controller.OtpController.text.isEmpty){
                            showToustMessage(context, 'Please Enter OTP');
                          } else if(controller.PasswordController.text.isEmpty){
                            showToustMessage(context, 'Please Enter Password');
                          } else if(controller.ConfirmPasswordController.text.isEmpty){
                            showToustMessage(context, 'Please Confirm Password');
                          } else if(controller.PasswordController.text != controller.ConfirmPasswordController.text){
                            showToustMessage(context, 'Passwords do not Match');
                          }else {
                              SignupBody body = SignupBody(
                                fullName: controller.NameController.text,
                                phoneNumber: controller.MobileNumberController.text,
                                password: controller.PasswordController.text,
                                confirmPassword: controller.ConfirmPasswordController.text
                              );
                              await controller.getRegistartionApi(body);
                              
                          }
                        }
                       },
                      text: Text('Register')),
                   ):Container(),
                   
                   Text('(or)', style: TextStyle(fontSize: 20, color: cWhiteColor),),vGap(10),
                 
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account ?', style: TextStyle(color: cWhiteColor),),hGap(5),
                      InkWell(
                        onTap: () {
                         Get.toNamed(AppRoutes.LoginScreen);
                            },
                          child: Text(
                             'Login',
                              style: TextStyle(fontSize: 13, color: cWhiteColor),
                              ))
                    ],
                   )
                 
                 
              
                ],
              ),
            ),
           ),
           ),
         ) 
      ),
    );
  }

  
}