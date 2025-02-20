import 'package:vendor_new_app/helper/api/api_constant.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/modal/createBusiness.modal.dart';

class CreateBusinessApi extends ApiServiceProvider {
  
  // Create Business API
  Future<dynamic> CreateBusinessMainApi(CreateBusinessBody body) async {
    try {
      var businessResponse = await postMethod(
        'https://vendor.payzopartner.in/payzo-api/addBusiness',
        body.toJson(),
      );

      print(businessResponse);

      if (businessResponse is CommonResponseModel) {
        return businessResponse;  
      } else {
        return CreateBusinessModal.fromJson(businessResponse);
      }
    } catch (e) {
      print("Error in CreateBusinessMainApi: $e");

    }
  }

  // Get States API
  Future<dynamic> getStatesApi() async {
    try {
      var statesResponse = await getMethod('https://vendor.payzopartner.in/payzo-api/getStates');

      print(statesResponse);

      if (statesResponse is CommonResponseModel) {
        return statesResponse;
      } else {
        return GetStatesModal.fromJson(statesResponse);
      }
    } catch (e) {
      print("Error in getStatesApi: $e");
      return showToustMessage2(message: 'Failed to get states');
    }
  }

  // Get Cities API
  Future<dynamic> getCitiesApi(SelectCitiesBody body) async {
    try {
      var cityResponse = await postMethod(
        'https://vendor.payzopartner.in/payzo-api/getCities',
        body.toJson(),
      );

      print(cityResponse);

      if (cityResponse is CommonResponseModel) {
        return cityResponse;
      } else {
        return SelectCitiesModal.fromJson(cityResponse);  
      }
    } catch (e) {
      print("Error in getCitiesApi: $e");

    }
  }

  // Get Categories API
  Future<dynamic> getCategoriesApi() async {
    try {
      var categoryResponse = await getMethod('https://vendor.payzopartner.in/payzo-api/getAllbusinesscategory');

      print(categoryResponse);
      if (categoryResponse is CommonResponseModel) {
        return categoryResponse;
      } else {
       
        return CategoriesBody.fromJson(categoryResponse);
      }
    } catch (e) {
      print("Error in getCategoriesApi: $e");

    }
  }
}
