import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/cString.dart';
import 'package:vendor_new_app/helper/constants/cTextFormField.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  SingleChildScrollView(
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
           vGap(35),
          
          
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
              
              hintText: 'Please Enter Your Name',
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CTextFormField(
              hintText: 'Please Enter Mobile Number',
              keyboardType: TextInputType.number,
              suffixIcon: CButton(
                onPressed: (){
                  
                },
                width: getWidth(context)/3,
               
                text: Text('send OTP')),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CTextFormField(
              hintText: 'Please Enter OTP',
              keyboardType: TextInputType.number,
              suffixIcon: CButton(
                onPressed: (){
                  
                },
                width: getWidth(context)/3,
               
                text: Text('Verify OTP')),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CTextFormField(
                obsecureText: true,
                 hintText: 'Enter Your Password'
                 ),
            ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CTextFormField(
                               obsecureText: true,
                               keyboardType: TextInputType.emailAddress,

                 hintText: 'Re-Enter Your Password'
                 ),
               ),
               vGap(20),


               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CButton(
                  borderRadius: 10,
                  color: Colors.white,
                  width: getWidth(context)/1,
                  height: getHeight(context)/18,
                   onPressed: (){
                 
                   },
                  text: Text('Register')),
               ),
               
               Text('(or)', style: TextStyle(fontSize: 20, color: cWhiteColor),),vGap(10),

               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account ?', style: TextStyle(color: cWhiteColor),),hGap(5),
                  Text('Login.', style: TextStyle(color: cWhiteColor),)
                ],
               )


            

            
            

            
           

          
          
            ],
          ),
        ),
       ),
       ) 
    );
  }
}