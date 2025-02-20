import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';

class initialScreen extends StatelessWidget {
  const initialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration:BoxDecoration(
          gradient: BackgroundGradient
        ),
        width: getWidth(context),
        height: getHeight(context),
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
          
            CButton(
             width: getWidth(context)/1.5,
             height: getHeight(context)/20,
             borderRadius: 5,
             onPressed: () {
               Get.toNamed(AppRoutes.LoginScreen);
             },
             text: Text('Login'),),
             SizedBox(height: 5,),
            
              CButton(
             width: getWidth(context)/1.5,
             height: getHeight(context)/20,
             borderRadius: 5,
             onPressed: () {
               Get.toNamed(AppRoutes.SignupScreen);
             },
             text: Text('Signup'),),     
            
                  
           ],
                  ),
        ),
    )
    );
  }
}