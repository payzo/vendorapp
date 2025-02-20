

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_new_app/helper/constants/image_constants.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/splash_page/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.asset(
              width: getWidth(context)/3.5,
              height: getHeight(context)/3.5,
              ImageConstants.vendorLogoPng),
              Text('Connecting People....', style: GoogleFonts.zeyada(color: Colors.purple,fontSize: 20, fontWeight: FontWeight.w600 ),)
            ],
          ),
          
        )
      ),
    );
  }
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Get.put(SplashController()).checkLogin();
});}
}