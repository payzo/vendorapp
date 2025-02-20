import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';




class Editbusinessscreen extends StatelessWidget{

  
    final int? businessId = Get.arguments;


  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue[900],
      centerTitle: true,
      toolbarHeight: 100,
      title: Text('Edit Business', style: TextStyle(color: cWhiteColor),),
      leading: IconButton(onPressed: (){
       Get.back();
      }, icon: Icon(
        color: cWhiteColor,
        Icons.home
      )),

      actions: [
        IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.logout, color: cWhiteColor)),
        
      ],

    ),
    body: Center(
      child: Text(
        'Your Business Id is $businessId'
      ),
    ),
    
    );
  }
}