import 'package:get/get.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/views/login_page/binding/Dashboard_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/bigscreen_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/createBusiness_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/editBusiness_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/forgotpassword_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/login_binding.dart';
import 'package:vendor_new_app/views/login_page/binding/mybusiness_binding.dart';
import 'package:vendor_new_app/views/login_page/screen/bigScreen.dart';
import 'package:vendor_new_app/views/login_page/screen/businessScreen.dart';
import 'package:vendor_new_app/views/login_page/screen/createBusinessScreen.dart';
import 'package:vendor_new_app/views/login_page/screen/dashboardscreen.dart';
import 'package:vendor_new_app/views/login_page/screen/editbusinessScreen.dart';
import 'package:vendor_new_app/views/login_page/screen/forgotPasswordScreen.dart';
import 'package:vendor_new_app/views/login_page/screen/loginscreen.dart';
import 'package:vendor_new_app/views/login_page/screen/screenone.dart';
import 'package:vendor_new_app/views/login_page/screen/signupscreen.dart';
import 'package:vendor_new_app/views/splash_page/binding/splash_binding.dart';
import 'package:vendor_new_app/views/splash_page/screens/splash_screen.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
        binding: SplashBinding(),
        name: AppRoutes.splashScreen,
        page: () => SplashScreen()),
    GetPage(name: AppRoutes.initialScreen, page: () => initialScreen()),
    GetPage(name: AppRoutes.SignupScreen, page: () => SingupScreen()),
    GetPage(
      binding: LoginBinding(),
      name: AppRoutes.LoginScreen,
      page: () => LoginSreen(),
    ),
    GetPage(
      binding: ForgotpasswordBinding(),
      name: AppRoutes.Forgotpasswordscreen,
      page: () => Forgotpasswordscreen(),
    ),
    GetPage(
      binding: DashboardBinding(),
      name: AppRoutes.DashboardScreen,
      page: ()=> Dashboardscreen()
    ),
    GetPage(
      binding: CreatebusinessBinding(),
      name: AppRoutes.CreateBusinessScreen,
      page: () => CreateBusinessScreen(),
    ),
    GetPage(
      binding: MybusinessBinding(),
      name: AppRoutes.MyBusinessScreen,
       page: () => MyBusiness(),
       
       ),
       GetPage(
        binding: BigscreenBinding(),
        name: AppRoutes.BigScreenBusiness,
        page: () =>  Bigscreen(),
       ),
       GetPage(
        binding: EditbusinessBinding(),
        name: AppRoutes.Editbusinessscreen,
        page: () => Editbusinessscreen(),
       )
  ];
}
