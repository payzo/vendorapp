import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/bigscreen_controller.dart';
import 'package:vendor_new_app/views/login_page/controller/deleteBusiness_controller.dart';
import 'package:vendor_new_app/views/login_page/modal/bigscreen.modal.dart';
import 'package:vendor_new_app/views/login_page/modal/deletebusiness.modal.dart';

class Bigscreen extends StatefulWidget {
  @override
  _BigscreenState createState() => _BigscreenState();
}

class _BigscreenState extends State<Bigscreen> {
  final BigscreenController controller = Get.put(BigscreenController());
  final DeletebusinessController deleteController = Get.put(DeletebusinessController());
  int? previousBusinessId;

  @override
  void initState() {
    super.initState();
    _fetchBusinessData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final int? businessId = Get.arguments;
    if (businessId != null && businessId != previousBusinessId) {
      _fetchBusinessData();
      previousBusinessId = businessId;
    }
  }

  void _fetchBusinessData() {
    final int? businessId = Get.arguments;

    if (businessId != null) {
      final box = GetStorage();
      box.write('businessId', businessId);
      controller.getBusinessByBusinessIdApi();
    } else {
      controller.errorMessage.value = "Business ID is missing.";
    }
  }

  Future<void> _onRefresh() async {
    _fetchBusinessData();
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business Overview',
          style: TextStyle(fontWeight: FontWeight.w500, color: cWhiteColor),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            color: cWhiteColor,
            Icons.home,
          ),
        ),
        actions: [
          IconButton(
            color: cWhiteColor,
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage.value.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            }

            if (controller.business.value == null) {
              return Center(child: Text("No Business Found by Business Id"));
            }

            Business business = controller.business.value!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  business.profileImage != null
                      ? Image.network(business.profileImage!)
                      : Icon(Icons.business, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Business Name: ${business.businessName?.toUpperCase() ?? "No Name"}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[900]),
                  ),
                  SizedBox(height: 10),
                  Text('Vendor Name: ${business.vendorName ?? "No Vendor Name"}'),
                  SizedBox(height: 10),
                  Text('Business Type: ${business.businessType ?? "No Type"}'),
                  SizedBox(height: 10),
                  Text('Category: ${business.categoryName ?? "No Category"}'),
                  SizedBox(height: 10),
                  Text('Phone: ${business.phoneNumber ?? "No Phone"}'),
                  SizedBox(height: 10),
                  Text('Email: ${business.email ?? "No Email"}'),
                  SizedBox(height: 10),
                  Text('Address: ${business.address ?? "No Address"}'),
                  SizedBox(height: 10),
                  Text('Status: ${business.status ?? "Unknown Status"}'),
                  Text('PinCode: ${business.pincode ?? "Pincode"}'),
                  SizedBox(height: 10),
                  Text(
                    'Approval Status: ${business.approvalStatus?.toUpperCase() ?? "No Address"}',
                    style: TextStyle(color: Colors.purple),
                  ),
                  SizedBox(height: 10),
                  Text('City Name: ${business.cityName ?? "No Address"}'),
                  SizedBox(height: 10),
                  Text('State Name: ${business.stateName ?? "No Address"}'),
                  SizedBox(height: 10),

                  // Edit Business Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        minimumSize: Size(getWidth(context) / 1.5, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.Editbusinessscreen,
                            arguments: business.businessId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(color: Colors.white, Icons.edit),
                          hGap(50),
                          Text(
                            'Edit Business',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Delete Business Button
                  vGap(2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        minimumSize: Size(getWidth(context) / 1.5, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () async {
                        DeleteBusinessBody body = DeleteBusinessBody(businessId: previousBusinessId.toString());
                        await deleteController.getDeleteBusinessApi(body);
                        controller.business.value = null;
                        controller.errorMessage.value = "Business deleted successfully";
                        Get.back();
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(color: Colors.white, Icons.delete),
                          hGap(50),
                          Text(
                            'Delete Business',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  vGap(2),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
