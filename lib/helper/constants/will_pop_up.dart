import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';

import '../../utils/display_utils.dart';



willpopAlert(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: cWhiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Container(
          width: getWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Are you sure you want to exit?',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  hGap(10),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.cancel
                    )
                  ),
                  hGap(10),
                  InkWell(
                    onTap: () async {
                      await SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    child: Icon(
                      Icons.check
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
