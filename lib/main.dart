
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:get_storage/get_storage.dart';

import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/constants/app_constants.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_pages.dart';
import 'package:vendor_new_app/routes/app_routes.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await initServices();
  await GetStorage.init();
  runApp(

      // DevicePreview(builder: (context) =>

      PayzoVendorApp()

      //  )
      );
}

Future<void> initServices() async {
  Get.put(ApiServiceProvider, permanent: true);
}

class PayzoVendorApp extends StatelessWidget {
  const PayzoVendorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: _buildAppTheme(context),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.initial,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }

  ThemeData _buildAppTheme(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.atkinsonHyperlegibleTextTheme(
        Theme.of(context).textTheme,
      ).apply(
        bodyColor: cBlackColor,
        displayColor: cWhiteColor,
      ),
      primaryColor: cWhiteColor,
      scaffoldBackgroundColor: cWhiteColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
