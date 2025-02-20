// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:vendor_new_app/helper/commons/base_controller.dart';
// import 'package:vendor_new_app/helper/commons/common_model.dart';
// import 'package:vendor_new_app/routes/app_routes.dart';
// import 'package:vendor_new_app/utils/display_utils.dart';
// import 'package:vendor_new_app/views/login_page/modal/login.modal.dart';
// import 'package:vendor_new_app/views/login_page/data/login_api.dart';

// class LoginController extends BaseController {
//   final TextEditingController PhoneNumberController = TextEditingController();
//   final TextEditingController PasswordController = TextEditingController();
//   LoginApi  loginApi= LoginApi();
//   int deniedCount = 0;
//   UserData? user;


//     getAddVoteApi(LoginBody body) async {
//     updateLoading(value: true);
//     update();
//     var data = await loginApi.addVoteApi(body);


//     if (data is CommonResponseModel) {
//       showToustMessage2( message:data.message??"");
//     } else {
//       user = await data;
//       if (user != null) {
//           final box = GetStorage();
//              box.write('vendorId', user!.vendorId??"");
//              box.write('vendorName', user!.fullName??"");
//           showToustMessage2( message: 'Login Successfully');
//          await    Get.toNamed(AppRoutes.DashboardScreen);

//         return;
//       }

//     }
//     update();
//     updateLoading(value:false);}
 

//   // // Login function with API call and proper state management
//   // Future<void> loginData(LoginBody body) async {
//   //   try {
//   //     updateLoading(true);
//   //     update();


//   //     var loginData = await LoginApi().loginApi(body);
//   //     updateLoading(false);
//   //     update();

//   //     if (loginData == null) {
//   //       showToustMessage2(title: 'Failed', message: 'Login data is null');
//   //       return;
//   //     }

//   //     if (loginData is LoginRes) {
//   //       if (loginData.success == true) {

//   //         if (user != null) {
//   //           final box = GetStorage();
//   //           box.write('vendorId', user!.vendorId);

//   //           showToustMessage2(title: 'Success', message: 'Login Successfully');
//   //           Get.toNamed(AppRoutes.SignupScreen); 
//   //         } else {
//   //           showToustMessage2(title: 'Failed', message: 'User data is missing');
//   //         }
//   //       } else {
//   //         showToustMessage2(title: 'Failed', message: 'Login Failed');
//   //       }
//   //     } else if (loginData is CommonResponseModel) {
//   //       showToustMessage2(title: 'Failed', message: 'Unknown error occurred');
//   //     }
//   //   } catch (e) {
//   //     updateLoading(false);
//   //     showToustMessage2(title: 'Error', message: 'An error occurred: $e');
//   //   }
//   // }

//   // // Refactored permissions check function (no recursion)
//   // Future<void> checkAndRequestPermissions(BuildContext context) async {
//   //   var status = await Permission.camera.status;
//   //   if (status.isDenied) {
//   //     await Permission.camera.request();
//   //   }
//   //   // Add additional permission requests as needed (e.g., storage, location)
//   // }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/login_api.dart';
import 'package:vendor_new_app/views/login_page/modal/login.modal.dart';

class LoginControler extends BaseController{

    final TextEditingController PhoneNumberController = TextEditingController();
   final TextEditingController PasswordController = TextEditingController();

    LoginApi loginapis = LoginApi();
    int deniedCount = 0;

    getLoginApi(LoginBody body) async {
      updateLoading(value: true);
      update();


      var logindata = await loginapis.LoginMainApi(body);

      if(logindata is CommonResponseModel){
        showToustMessage2(message: "wrong Password");
         return Get.toNamed(AppRoutes.LoginScreen);
      }else{
        showToustMessage2(message: "Login Successfully");
        Get.toNamed(AppRoutes.DashboardScreen);
        update();
        return;
      }
    }

}