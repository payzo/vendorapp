import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:custom_image_crop/custom_image_crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor_new_app/helper/constants/cbutton.dart';

// ignore: must_be_immutable
class ImageCrop extends StatefulWidget {
  var image;
  num? height;
  num? width;

  ImageCrop({
    required this.image,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  _ImageCropState createState() => _ImageCropState();
}

class _ImageCropState extends State<ImageCrop> {
  late CustomImageCropController controller;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller = CustomImageCropController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomImageCrop(
              imageFit: CustomImageFit.fillCropWidth,
              ratio: Ratio(
                  height: widget.height?.toDouble() ?? 19,
                  width: widget.width?.toDouble() ?? 9),
              shape: CustomCropShape.Ratio,
              cropController: controller,
              image: FileImage(widget.image),
            ),
          ),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.refresh), onPressed: controller.reset),
              IconButton(
                  icon: const Icon(Icons.zoom_in),
                  onPressed: () =>
                      controller.addTransition(CropImageData(scale: 1.33))),
              IconButton(
                  icon: const Icon(Icons.zoom_out),
                  onPressed: () =>
                      controller.addTransition(CropImageData(scale: 0.75))),
              IconButton(
                  icon: const Icon(Icons.rotate_left),
                  onPressed: () =>
                      controller.addTransition(CropImageData(angle: -pi / 4))),
              IconButton(
                  icon: const Icon(Icons.rotate_right),
                  onPressed: () =>
                      controller.addTransition(CropImageData(angle: pi / 4))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CButton(
                    text: Text('Crop'),
                    
                    onPressed: () async {
                      final image = await controller.onCropImage();
                      if (image != null) {
                        var per1 = await Permission.storage.isDenied;
                        if (per1) {
                          // PermissionStatus per =
                          //     await Permission.storage.request();
                        }
                        final tempDir = await getApplicationCacheDirectory();
                        final file = await File(
                                '${tempDir.path}/userimage${now.day.toString() + now.month.toString() + now.year.toString() + now.hour.toString() + now.minute.toString() + now.second.toString()}.jpg')
                            .create();
                        file.writeAsBytesSync(image.bytes);
                        Uint8List? result =
                            await FlutterImageCompress.compressWithFile(
                                file.path,
                                quality: 50);
                        File(file.path).writeAsBytes(result!);
                        setState(() {});
                        Get.back(result: file);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
