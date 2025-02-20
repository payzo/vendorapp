import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor_new_app/helper/constants/colors.dart';

Future<void> checkAndRequestPermissions(deniedCount, context) async {
  PermissionStatus cameraStatus = await Permission.camera.status;
  PermissionStatus storageStatus = await Permission.storage.status;
  PermissionStatus contectStatus = await Permission.contacts.status;
  PermissionStatus locationStatus = await Permission.location.status;

  // If both permissions are granted, reset the denied count and return
  if (cameraStatus.isGranted &&
      storageStatus.isGranted &&
      contectStatus.isGranted &&
      locationStatus.isGranted) {
    deniedCount = 0;
    return;
  }

  // Handle permissions that are denied or permanently denied
  if (cameraStatus.isDenied ||
      storageStatus.isDenied ||
      contectStatus.isDenied ||
      locationStatus.isDenied) {
    deniedCount++;
    if (deniedCount >= 2) {
      openAppSettingsDialog(context);
    } else {
      requestPermissions(deniedCount, context);
    }
  } else if (cameraStatus.isPermanentlyDenied ||
      storageStatus.isPermanentlyDenied ||
      contectStatus.isPermanentlyDenied ||
      locationStatus.isPermanentlyDenied) {
    openAppSettingsDialog(deniedCount);
  }
}

Future<void> requestPermissions(deniedCount, context) async {
  Map<Permission, PermissionStatus> permissionStatus = await [
    Permission.camera,
    Permission.storage,
    Permission.contacts,
    Permission.location,
  ].request();

  if (permissionStatus[Permission.camera]!.isGranted &&
      permissionStatus[Permission.storage]!.isGranted &&
      permissionStatus[Permission.contacts]!.isGranted &&
      permissionStatus[Permission.location]!.isGranted) {
    deniedCount = 0;
  } else if (permissionStatus[Permission.camera]!.isDenied ||
      permissionStatus[Permission.storage]!.isDenied ||
      permissionStatus[Permission.contacts]!.isDenied ||
      permissionStatus[Permission.location]!.isDenied) {
    deniedCount++;
    if (deniedCount >= 2) {
    } else {
      showPermissionExplanationDialog(
        deniedCount,
        context,
      );
    }
  } else if (permissionStatus[Permission.camera]!.isPermanentlyDenied ||
      permissionStatus[Permission.storage]!.isPermanentlyDenied ||
      permissionStatus[Permission.contacts]!.isPermanentlyDenied ||
      permissionStatus[Permission.location]!.isPermanentlyDenied) {
    openAppSettingsDialog(deniedCount);
  }
}

void showPermissionExplanationDialog(deniedCount, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: cWhiteColor,
        title: Text("Permissions Required"),
        content: Text(
            "This app needs camera and storage permissions to function correctly. Please grant the permissions."),
        actions: [
          TextButton(
            child: Text("Retry"),
            onPressed: () {
              Get.back();
              requestPermissions(deniedCount, context);
            },
          ),
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}

void openAppSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: cWhiteColor,
        title: Text("Permissions Required"),
        content: Text(
            "This app needs camera and storage permissions. Please enable them in the app settings."),
        actions: [
          TextButton(
            child: Text("Open Settings"),
            onPressed: () {
              openAppSettings();
              Get.back();
            },
          ),
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
