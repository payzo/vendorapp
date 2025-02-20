import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  bool loading = false;
  String message = "";
  bool widgetLoading = false;

  // used to update loader
  updateLoading({bool value = false}) {
    loading = value;
    update();
  }

  updateWidgetLoading({bool value = false}) {
    widgetLoading = value;
    update();
  }

  @override
  void onInit() {
    if (Get.context != null) {}
    super.onInit();
  }
}
