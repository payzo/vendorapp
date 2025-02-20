import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/routes/app_routes.dart';
import 'package:vendor_new_app/utils/display_utils.dart';
import 'package:vendor_new_app/views/login_page/controller/login_controler.dart';

// ignore: must_be_immutable
class Dashboardscreen extends StatelessWidget {
  Dashboardscreen({super.key});


  final LoginControler controller  = Get.put(LoginControler());
  String vendorId = GetStorage().read('vendorId').toString();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 5, 52, 99),
        leading: Icon(
          color: Colors.white,
          Icons.home,
        ),
        title: Text(
          'Welcome Vendor',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: getWidth(context),
          height: getHeight(context),
          child: Column(
            children: [
              vGap(20),

              Text('Youre Vendor Id is : $vendorId'),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    minimumSize: Size(getWidth(context) / 1.4, 50), 
                    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Set border radius to 0
      ),
                  
                    
                  ),
                  onPressed: () {
                  Get.toNamed(AppRoutes.CreateBusinessScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.create
                      ),
                      hGap(50),
                      Text(
                        'Create Business',
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
              vGap(5),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    minimumSize: Size(getWidth(context) / 1.2, 50), 
                    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
                  ),
                  onPressed: () {
                   Get.toNamed(AppRoutes.MyBusinessScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.store
                      ),
                      hGap(50),
                      Text(
                        'My Business',
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
              vGap(5),
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
                  
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.facebook
                      ),
                      hGap(50),
                      Text(
                        'Whatsapp Support',
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
              vGap(5),
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
                  
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.web
                      ),
                      hGap(50),
                      Text(
                        'Website',
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
              
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
