import 'package:get/get.dart';

import '../../../helper/commons/base_controller.dart';
import '../../../routes/app_routes.dart';


class SplashController extends BaseController {
  checkLogin() async {
    // final box = GetStorage();
    // final authToken = box.read('auth_token');
    // final isProfileUpdate = box.read('isProfileUpdated');
    // final deviceToken = box.read('deviceToken');

//     if (authToken != null &&
//         isProfileUpdate == "Yes" &&
//         deviceToken != null &&
//         deviceToken.isNotEmpty) {
//       Get.offAll(BotNav(tabIndexId: 0));
//     } else {
//     }
//   }
      Get.toNamed(AppRoutes.initialScreen);
}
}