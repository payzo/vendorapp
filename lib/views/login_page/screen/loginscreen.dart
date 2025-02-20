import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/cString.dart';
import 'package:vendor_new_app/helper/constants/cTextFormField.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/login_controler.dart';

import 'package:vendor_new_app/views/login_page/modal/login.modal.dart';

class LoginSreen extends StatelessWidget {
  LoginSreen({super.key});

  final LoginControler controller = Get.put(LoginControler());
  final formkey = GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControler>(
      builder: (controller) => Scaffold(
        body: Form(
          key: formkey,
          child:
           Container(
            decoration: BoxDecoration(gradient: BackgroundGradient),
            width: getWidth(context),
            height: getHeight(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        vGap(30),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: cWhiteColor,
                              )),
                        ),
                        vGap(70),
                        Text(
                          CStrings.welcomeBack,
                          style: TextStyle(
                            fontSize: 30,
                            color: cWhiteColor,
                          ),
                        ),
                        vGap(50),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CTextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controller.PhoneNumberController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              hintText: 'Please Enter Phone Number',
                            )),
                        SizedBox(
                          height: 0.5,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CTextFormField(
                              obsecureText: true,
                              controller: controller.PasswordController,
                              hintText: 'Please Enter Password',
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.Forgotpasswordscreen);
                            },
                            child: Text('Forgot Password ?', style: TextStyle(color: cWhiteColor),),
                          )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CButton(
                              borderRadius: 10,
                              width: getWidth(context),
                              height: getHeight(context) / 15,
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                               
                                  if (controller
                                      .PhoneNumberController.text.isEmpty) {
                                    showToustMessage(context,
                                        'Please enter a mobile number');
                                  }  else if (controller
                                      .PasswordController.text.isEmpty) {
                                    showToustMessage(
                                        context, 'Please enter a password');
                                  } else if (!checkPasswordValidation(
                                      controller.PasswordController.text)) {
                                    showToustMessage(
                                        context, 'Please enter valid password');
                                        return false;
                                  } else {
           
                                   
                                       LoginBody body=LoginBody(phoneNumber:controller
                                                .PhoneNumberController.text,confirmPassword: controller
                                                .PasswordController.text );
                                    await controller.getLoginApi( body );
                                  }
                                }
                              },
                              text: Text('Login')),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '(or)',
                          style: TextStyle(color: cWhiteColor, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CStrings.DonthaveanAccount,
                              style: TextStyle(color: cWhiteColor),
                            ),
                            hGap(10),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.SignupScreen);
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(color: cWhiteColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
                     )
        ),
      ),
    );
  }
}
