import 'dart:convert';

CommonResponseModel commonResponseModelFromMap(String str) =>
    CommonResponseModel.fromMap(json.decode(str));

String commonResponseModelToMap(CommonResponseModel data) =>
    json.encode(data.toMap());

class CommonResponseModel {
  CommonResponseModel({
    this.message,
    this.statusCode,
    this.image,
  });

  String? message;
  int? statusCode;
  String? image;

  factory CommonResponseModel.fromMap(Map<String, dynamic> json) =>
      CommonResponseModel(
        message: json["message"],
        statusCode: json["statusCode"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "statusCode": statusCode,
        "image": image,
      };
}
