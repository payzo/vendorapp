import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/deletebusiness_api.dart';
import 'package:vendor_new_app/views/login_page/modal/deletebusiness.modal.dart';

class DeletebusinessController extends BaseController {
  DeletebusinessApi deletebusapi = DeletebusinessApi();

  int deniedCount = 0;

  Future<void> getDeleteBusinessApi(DeleteBusinessBody body) async {
    try {

      updateLoading(value: true);
      update();

      var responsedata = await deletebusapi.DeleteBusiness(body);

      if (responsedata is DeleteBusinessModal) {
        if (responsedata.success) {
          showToustMessage2(message: "Business Deleted Successfully");

          final box = GetStorage();
          box.remove('businessId');
        } else {
     
          showToustMessage2(message: responsedata.message ?? "");
        }
      } else {
  
        showToustMessage2(message: "Unexpected response format.");
      }
    } catch (e) {
      print("Error in deleting business: $e");
      showToustMessage2(message: "An error occurred while deleting the business.");
    } finally {
      updateLoading(value: false);
      update();
    }
  }
}
