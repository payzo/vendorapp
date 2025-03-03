import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/constants/cString.dart';
import 'package:vendor_new_app/helper/constants/cTextFormField.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/forgotpassword_controller.dart';
import 'package:vendor_new_app/views/login_page/modal/forgotpassword.modal.dart';


// ignore: must_be_immutable
class Forgotpasswordscreen extends StatelessWidget{
   Forgotpasswordscreen({super.key});


final ForgotpasswordController controller = Get.put(ForgotpasswordController());
final formkey = GlobalKey<FormState>();
String vendorId = GetStorage().read('vendorId').toString();



@override
Widget build(BuildContext context){
  return GetBuilder<ForgotpasswordController>(builder: (controller) => 
   Scaffold(
    body: Form(
      key : formkey,
      child : 
     SingleChildScrollView(
      child:   Container(
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
               vGap(80),
                   

                   Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: (){
                    Get.back();
                }, icon: Icon(
                  color: cWhiteColor,
                  Icons.arrow_circle_left,
                  size: 30,
                )),
                   ),
                vGap(10),


                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child:          Text(CStrings.ohnoForgot, style: TextStyle(color: cWhiteColor, fontSize: 30),),
                   ),
                 ),
                 vGap(80),
       

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(
                    hintText: CStrings.pleaseEnterMobileNum,
                   controller: controller.PhoneNumberController,
                    keyboardType: TextInputType.number,
                     inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                               ],
                     
                    suffixIcon:
                     CButton(
                      color: buttonColornew,
                      borderRadius: 2,
                      onPressed: () async{
                       if(formkey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        formkey.currentState!.save();


                      if(controller.PhoneNumberController.text.isEmpty){
                        showToustMessage2(message: "Please Enter Mobile Number");
                      }else{
                        ForgotPasswordSendOTPBody body = ForgotPasswordSendOTPBody(
                          phoneNumber: controller.PhoneNumberController.text
                        );
                        await controller.getForgotPasswordSendOTPApi(body);
                      }
                       }
                      },
                      text:
                       Text('Send OTP', style: TextStyle( color: cWhiteColor, fontWeight: FontWeight.w600),)
                       ),
                  
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CTextFormField(
                    hintText: "Please Enter OTP",
                    keyboardType: TextInputType.number,
                     inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                               ],
                    controller: controller.OTPController,
                    suffixIcon:
                     CButton(
                      color:buttonColornew,
                      borderRadius: 3,
                      onPressed: () async{
                        if(formkey.currentState!.validate()){
                          FocusScope.of(context).unfocus();


                          if(controller.OTPController.text.isEmpty){
                            showToustMessage2(message: "Please Enter OTP");
                          }else{
                            ForgotPasswordVerfiyOTPBody body = ForgotPasswordVerfiyOTPBody(
                              phoneNumber: controller.PhoneNumberController.text,
                              otp : controller.OTPController.text
                            );
                            await controller.getForgotPasswordVerifyOTPApi(body);
                          }
                        }
                      },
                      text:
                       Text('Verify OTP', style: TextStyle( color: cWhiteColor, fontWeight: FontWeight.w600),)
                       ),
                  
                  ),
                ),
                
             controller.isShow.value == true?  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CTextFormField(
                  hintText: CStrings.newPassword,
                  controller: controller.passwordController,
                 
                 ),
             ):Container(),
              controller.isShow.value == true?  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CTextFormField(
                  hintText: CStrings.confirmPassword,
                  controller: controller.ConfirmPasswordController
                  
                 ),
                 
               ):Container(),
               vGap(20),


               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CButton(
                   
                  onPressed: ()async {
                   if(formkey.currentState!.validate()){
                    FocusScope.of(context).unfocus();
                    formkey.currentState!.save();

       
                      ForgotPasswordBody body = ForgotPasswordBody(
                        vendorId: vendorId,
                        nPassword: controller.passwordController.text,
                        cPassword: controller.ConfirmPasswordController.text,
                        
                      );
                      print(body.toJson());
                      await controller.getForgotPasswordApi(body);
                    }
                  
                  },
                  color: buttonColornew,
                  width: getWidth(context)/2,
                   height: getHeight(context) / 15,
                  text: Text(CStrings.updatePassword, style: TextStyle(color: cWhiteColor, fontWeight: FontWeight.w600),)),
               ),


               Text('(or)', style: TextStyle(color: cWhiteColor, fontSize: 16),),
               vGap(10),

               Text(CStrings.continuewithLogin, style: TextStyle(color: cBlackColor, fontSize: 16, fontWeight: FontWeight.w500),)
             
              ],
             ),
           ),
    ),
    )
    )
    
    
   
  )
  );
}


}