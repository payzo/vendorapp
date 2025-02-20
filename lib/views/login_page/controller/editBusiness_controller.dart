

import 'package:flutter/widgets.dart';
import 'package:vendor_new_app/helper/commons/base_controller.dart';
import 'package:vendor_new_app/helper/commons/common_model.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/data/create_business_api.dart';
import 'package:vendor_new_app/views/login_page/modal/createBusiness.modal.dart';
// Import the image picker

class EditbusinessController extends BaseController {
  final TextEditingController BusinessNameController = TextEditingController();
  final TextEditingController StoreTimgsController = TextEditingController();
  final TextEditingController VendorNameController = TextEditingController();
  final TextEditingController PhoneNumberController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PincodeController = TextEditingController();
  final TextEditingController GoogleMapLinkController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController KycDoumentTitleController = TextEditingController();
  final TextEditingController KycDoumentIdController = TextEditingController();
  final TextEditingController BusinessAddressController = TextEditingController();


  List<StatesData> stateList = []; 
  List<CitiesData> citiesList = []; 
  List<CategoryData> categorieList = [];
  String? selectedState;
  String? selectedCity;
  String? selectedCategory;
  String? selectedBusinessType;

String?vendorId;

  CreateBusinessApi createbusinessapis = CreateBusinessApi();


  int deniedCount = 0;



  getCreateBusinessApi(CreateBusinessBody body) async{
    updateLoading(value: true);
    update();

    try {

      var addBusiness = await createbusinessapis.CreateBusinessMainApi(body);

      if(addBusiness is CommonResponseModel){
        showToustMessage2(message: addBusiness.message??"");
      }else{
        showToustMessage2(message: "Business Registered Successfully");
        return;
      }
      
    } catch (e) {
      
    }
  }

  // Fetch Categories for Business
  getCategoriesforBusinessApi() async {
    updateLoading(value: true);
    update();

    try {
      var getCategoriesData = await createbusinessapis.getCategoriesApi();

      if (getCategoriesData is CommonResponseModel) {
        showToustMessage2(message: getCategoriesData.message ?? "Failed to fetch categories.");
      } else if (getCategoriesData is CategoriesBody) {
        categorieList = getCategoriesData.data ?? []; 
        showToustMessage2(message: "Categories fetched successfully!");

        if (categorieList.isNotEmpty) {
          selectedCategory = categorieList[0].id?.toString();
        }
      }
    } catch (e) {
      showToustMessage2(message: "Error fetching categories.");
    } finally {
      updateLoading(value: false);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategoriesforBusinessApi();
    getStatesforBusinessApi();  
  }

  getStatesforBusinessApi() async {
    updateLoading(value: true);
    update();

    try {
      var getStatesData = await createbusinessapis.getStatesApi();

      if (getStatesData is CommonResponseModel) {
        showToustMessage2(message: getStatesData.message ?? "Error fetching states");
      } else if (getStatesData is GetStatesModal) {
        showToustMessage2(message: "States Fetched Successfully");
        stateList = getStatesData.data ?? [];
      }
    } catch (e) {
      showToustMessage2(message: "Error fetching states");
    } finally {
      updateLoading(value: false);
      update();
    }
  }

  // Fetch Cities for Business
  getCitiesforBusinessApi(String stateId) async {
    updateLoading(value: true);
    update();

    try {
      SelectCitiesBody body = SelectCitiesBody(stateId: stateId);
      var getCitiesData = await createbusinessapis.getCitiesApi(body);

      if (getCitiesData is SelectCitiesModal) {
        if (getCitiesData.success == true && getCitiesData.data != null) {
          citiesList = getCitiesData.data!;
          showToustMessage2(message: "Cities Fetched Successfully");
        } else {
          showToustMessage2(message: "No records found for the provided state ID $stateId");
        }
      } else {
        showToustMessage2(message: "Error fetching cities");
      }
    } catch (e) {
      showToustMessage2(message: "Error fetching cities");
    } finally {
      updateLoading(value: false);
      update();
    }
  }

//   // Business form submission
//   submitBusinessForm(String vendorId) async {
//     if (BusinessNameController.text.isEmpty) {
//       showToustMessage2(message: 'Please enter business name');
//       return;
//     }

//     if (PhoneNumberController.text.isEmpty) {
//       showToustMessage2(message: 'Please enter phone number');
//       return;
//     }

//     if (selectedState == null) {
//       showToustMessage2(message: 'Please select a state');
//       return;
//     }

//     if (selectedCity == null) {
//       showToustMessage2(message: 'Please select a city');
//       return;
//     }

//     if (selectedCategory == null) {
//       showToustMessage2(message: 'Please select a category');
//       return;
//     }

//     if (_businessImage == null) {
//       showToustMessage2(message: 'Please upload a business image.');
//       return;
//     }

//     if (_kycDocumentImage == null) {
//       showToustMessage2(message: 'Please upload the KYC document image.');
//       return;
//     }

//     CreateBusinessBody body = CreateBusinessBody(
//     vendorId: vendorId,
//       businessName: BusinessNameController.text,
//       businessType: selectedBusinessType,
//       storeTiming: StoreTimgsController.text,
//       vendorName: VendorNameController.text,
//       phoneNumber: PhoneNumberController.text,
//       email: EmailController.text,
//       pincode: PincodeController.text,
//       googleMapLink: GoogleMapLinkController.text,
//       websiteLink: websiteLinkController.text,
//       documentTitle: KycDoumentTitleController.text,
//       documentId: KycDoumentIdController.text,
//       stateId: selectedState,
//       cityId: selectedCity, 
//       categoryId: selectedCategory, 
//       profileImage: _businessImage,
//       kycDocImage: _kycDocumentImage,
//       approvalStatus: "pending",
//       remark: "no remarks"
//     );

//     var response = await createbusinessapis.CreateBusinessMainApi(body);
//     if (response is CommonResponseModel) {
//       showToustMessage2(message: response.message ?? "Business creation failed");
//     } else if (response is CreateBusinessModal) {
//       showToustMessage2(message: response.message ?? "Business created successfully");
//     }
//   }

//  // Method to set business image
// void setBusinessImage(XFile? pickedImage) {
//   if (pickedImage != null) {
//     _businessImage = pickedImage.path; 
//   }
//   update(); 
// }

// void setKYCImage(XFile? pickedImage) {
//   if (pickedImage != null) {
//     _kycDocumentImage = pickedImage.path; 
//   }
//   update();  
}

