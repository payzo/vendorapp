import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/views/login_page/controller/my_business_controller.dart';
import 'dart:async';

// ignore: must_be_immutable
class MyBusiness extends StatelessWidget {
  dynamic vendorId = GetStorage().read('vendorId').toString();
  final MyBusinessController controller = Get.put(MyBusinessController());

  @override
  Widget build(BuildContext context) {
    controller.getBusinessByUserApi();

   
    Timer.periodic(Duration(minutes: 5), (Timer t) {
      controller.getBusinessByUserApi(); 
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue[900],
        title: Text(
          'My Business',
          style: TextStyle(color: cWhiteColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(color: cWhiteColor, Icons.home),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Implement logout logic
              },
              icon: Icon(color: cWhiteColor, Icons.logout))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.businesses.isEmpty) {
          return Center(child: Text("No businesses found."));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getBusinessByUserApi(); 
            },
            child: ListView.builder(
              itemCount: controller.businesses.length,
              itemBuilder: (context, index) {
                var business = controller.businesses[index];

                return Card(
                  shape: Border.all(),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: SizedBox(
                    height: 430,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 280,
                          width: double.infinity,
                          child: business.profileImage != null
                              ? Image.network(
                                  business.profileImage!,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.business, size: 50),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      business.businessName?.toUpperCase() ??
                                          'No Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue[900]),
                                    ),
                                    SizedBox(height: 4),
                                    Text(business.businessType ?? 'No Type'),
                                    SizedBox(height: 4),
                                    Text(business.categoryName ?? 'Category'),
                                    SizedBox(height: 4),
                                    Text(business.businessId?.toString() ?? '0'),
                                    Text(
                                      business.approvalStatus?.toUpperCase() ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),

                                    
                                  ],
                                ),
                              ),
                              CButton(
                                text: Icon(
                                  Icons.arrow_circle_right,
                                  color: cBlackColor,
                                  size: 35,
                                ),
                                onPressed: () {
                                  Get.toNamed(AppRoutes.BigScreenBusiness,
                                      arguments: business.businessId);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
