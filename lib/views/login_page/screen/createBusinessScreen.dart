import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_new_app/helper/constants/cString.dart';
import 'package:vendor_new_app/helper/constants/cTextFormField.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/helper/constants/rectangleCropImage.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/createBusiness_controller.dart';
import 'package:vendor_new_app/views/login_page/modal/createBusiness.modal.dart';

// ignore: must_be_immutable


class CreateBusinessScreen extends StatefulWidget {
  @override
  _CreateBusinessScreenState createState() => _CreateBusinessScreenState();
}

class _CreateBusinessScreenState   extends State<CreateBusinessScreen> {
  
   dynamic vendorId = GetStorage().read('vendorId').toString();


  final CreatebusinessController controller = Get.put(CreatebusinessController());
  final formkey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
    XFile? _businessImage; 
   XFile? _kycDocumentImage; 

var businessTypes = ["online", "offline"];

Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
     
      var croppedImage = await Get.to(() => ImageCrop(
        image: File(pickedFile.path),
        height: 19,
        width: 9,
      ));
      if (croppedImage != null) {
        setState(() {
          _businessImage = XFile(croppedImage.path);
        });
      }
    }
  }

 
  Future<void> _pickKYCImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      
      var croppedImage = await Get.to(() => ImageCrop(
        image: File(pickedFile.path),
        height: 19,
        width: 9,
      ));
      if (croppedImage != null) {
        setState(() {
          _kycDocumentImage = XFile(croppedImage.path);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatebusinessController>(
      builder: (controller) => Scaffold(
        
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.home),
          ),
          title: Text(
            'Create Business',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body:
         Form(
          key: formkey,
          child: 
         Container(
          width: getWidth(context),
          height: getHeight(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  vGap(10),

                    

                   // Business Type Dropdown
                   Padding(
  padding: const EdgeInsets.all(8.0),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Please Select Business Type',
      style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
    ),
  ),
),
                   Padding(
  padding: const EdgeInsets.all(8.0),
  child: DropdownButtonFormField<String>(
    value: controller.selectedBusinessType ?? businessTypes[0],
    onChanged: (value) {
      if (value != null) {
        controller.selectedBusinessType = value;
        controller.update();
      }
    },
    items: businessTypes
        .map<DropdownMenuItem<String>>((type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(type),
          );
        })
        .toList(),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(),
      labelText: 'Select Business Type',
    ),
  ),
),


                  // Business Name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Business Name',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.BusinessName,
                      controller: controller.BusinessNameController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                  // Store Timings
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Store Timings',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.StoreTiming,
                      controller: controller.StoreTimgsController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                  // Vendor Name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Vendor Name',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.VendorName,
                      controller: controller.VendorNameController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                  // Phone Number
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Mobile Number',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.MobileNumber,
                      controller: controller.PhoneNumberController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                  // Category Dropdown
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Select Category',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedCategory,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedCategory = value;
                         
                        }
                      },
                      items: controller.categorieList
                          .map<DropdownMenuItem<String>>((state) {
                        return DropdownMenuItem<String>(
                          value: state.id.toString(),
                          child: Text(state.name ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                        labelText: 'Select Category',
                      ),
                    ),
                  ),

                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Email Address',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.Email,
                      controller: controller.EmailController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Business Address',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: 'Please Enter Business Address',
                      controller: controller.BusinessAddressController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Area Pincode',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: 'Please Enter Area Pincode',
                      controller: controller.PincodeController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),


                  

                  // State Selection
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Select State',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedState,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedState = value;
                          controller.selectedCity = null;
                          controller.update();
                          controller.getCitiesforBusinessApi(value);
                        }
                      },
                      items: controller.stateList
                          .map<DropdownMenuItem<String>>((state) {
                        return DropdownMenuItem<String>(
                          value: state.id.toString(),
                          child: Text(state.name ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                        labelText: 'Select State',
                      ),
                    ),
                  ),

                  // City Selection
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Select City',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedCity,
                      onChanged: (value) {
                        controller.selectedCity = value;
                        controller.update();
                      },
                      items: controller.citiesList
                          .map<DropdownMenuItem<String>>((city) {
                        return DropdownMenuItem<String>(
                          value: city.name, 
                          child: Text(city.name ?? ''),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                        labelText: 'Select City',
                      ),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Google Map Link',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.GoogleMapLink,
                      controller: controller.GoogleMapLinkController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter Website Link',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.WebLink,
                      controller: controller.websiteLinkController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter KYC Document Title',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.EnterKYCTilte,
                      controller: controller.KycDoumentTitleController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please Enter KYC Document ID',
                        style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CTextFormField(
                      hintText: CStrings.EnterKYCID,
                      controller: controller.KycDoumentIdController,
                      labelStyle: TextStyle(color: cBlackColor),
                    ),
                  ),
                   

                   Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Upload Business Image',
                          style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _businessImage != null
                              ? Image.file(
                                  File(_businessImage!.path),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Text('No image selected'),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: Text('Select Image'),
                          ),
                        ],
                      ),
                    ),

                    // Upload KYC Document Image
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Upload KYC Document Image',
                          style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
    


               Padding(
  padding: const EdgeInsets.all(10.0),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Upload KYC Document Image',
      style: TextStyle(color: cBlackColor, fontWeight: FontWeight.w600),
    ),
  ),
),
                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          _kycDocumentImage != null
                              ? Image.file(
                                  File(_kycDocumentImage!.path),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Text('No image selected'),
                          ElevatedButton(
                            onPressed: _pickKYCImage,
                            child: Text('Select Image'),
                          ),
                        ],
                      ),
                    ),

                  // Submit Button
                  CButton(
  color: Colors.blue[900],
  onPressed: () async {
    if (formkey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      if (controller.BusinessNameController.text.isEmpty) {
        showToustMessage2(message: "Please fill Business Name");
      } else if (controller.StoreTimgsController.text.isEmpty) {
        showToustMessage2(message: "Please fill Store Timings");
      } else if (controller.VendorNameController.text.isEmpty) {
        showToustMessage2(message: "Please fill Vendor Name");
      } else if (controller.PhoneNumberController.text.isEmpty) {
        showToustMessage2(message: "Please fill Mobile Number");
      } else if (controller.EmailController.text.isEmpty) {
        showToustMessage2(message: "Please fill Email Address");
      } else if (controller.BusinessAddressController.text.isEmpty) {
        showToustMessage2(message: "Please fill Business Address");
      } else if (controller.PincodeController.text.isEmpty) {
        showToustMessage2(message: "Please fill Pincode");
      } else if (controller.GoogleMapLinkController.text.isEmpty) {
        showToustMessage2(message: "Please fill Google Map Link");
      } else if (controller.websiteLinkController.text.isEmpty) {
        showToustMessage2(message: "Please fill Website Link");
      } else if (controller.KycDoumentTitleController.text.isEmpty) {
        showToustMessage2(message: "Please fill KYC Document Title");
      } else if (controller.KycDoumentIdController.text.isEmpty) {
        showToustMessage2(message: "Please fill KYC Document ID");
      } else if (_businessImage == null) {
        showToustMessage2(message: "Please upload Business Image");
      } else if (_kycDocumentImage == null) {
        showToustMessage2(message: "Please upload KYC Document Image");
      } else if ( _businessImage != null) {
        print(_businessImage?.path); 
         } else if (_businessImage == null) {
  showToustMessage2(message: "Please upload Business Image");
} else {
  print('Business Image Path: ${_businessImage?.path}');
 
}  {
        CreateBusinessBody body = CreateBusinessBody(
          vendorId: vendorId,
          businessName: controller.BusinessNameController.text,
          storeTiming: controller.StoreTimgsController.text,
          vendorName: controller.VendorNameController.text,
          phoneNumber: controller.PhoneNumberController.text,
          categoryId: controller.selectedCategory,
          email: controller.EmailController.text,
          businessType: controller.selectedBusinessType,
          address: controller.BusinessAddressController.text,
          pincode: controller.PincodeController.text,
          stateId: controller.selectedState,
          cityId: controller.selectedCity,
          googleMapLink: controller.GoogleMapLinkController.text,
          websiteLink: controller.websiteLinkController.text,
          documentTitle: controller.KycDoumentTitleController.text,
          documentId: controller.KycDoumentIdController.text,
          profileImage: _businessImage?.path,
          kycDocImage: _kycDocumentImage?.path,
        );

        await controller.getCreateBusinessApi(body);
      }
    }
  },
  text: Text('Submit Business', style: TextStyle(color: Colors.white)),
),

                ],
              ),
            ),
          ),
        ),
         )
      ),
    );
  }
}
