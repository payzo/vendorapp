import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_new_app/helper/constants/app_constants.dart';

import '../commons/common_model.dart';
import '../constants/app_enums.dart';

abstract class ApiServiceProvider extends GetConnect {
  // set base url

  JsonEncoder jsonEncoder = const JsonEncoder.withIndent('   ');
  final String _baseUrl = appVenderBaseurl;
  final storage = GetStorage();
  @override
  Future<void> onReady() async {
    httpClient.baseUrl = _baseUrl;

    String token = storage.read('auth_token') ?? "";
    // It's will attach 'apikey' property on header from all requests
    httpClient.addResponseModifier((request, response) async {
      return response; // add this
    });
    httpClient.addAuthenticator((Request request) async {
      request.headers["platform"] = (Platform.isAndroid) ? "android" : "ios";
      // request.headers["Content-Type"] = "application/x-www-form-urlencoded";
      request.headers["Content-Type"] = "multipart/form-data";
      request.headers["Accept"] = "application/json";
      request.headers["token"] = token;
      return request;
    });
    httpClient.maxAuthRetries = 3;
    //Authenticate will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    // httpClient.maxAuthRetries = 1;
  }

  // get method
  Future<dynamic> getMethod(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query}) async {
    try {
      var result = await httpClient.get(url,
          contentType: contentType,
          // headers: headers,
          query: query);

      if (result.body != null) {
        if (result.body["success"] == ApiStatus.success.value) {
          return await result.body;
        } else {
          return CommonResponseModel.fromMap(result.body);
        }
      } else {
        return CommonResponseModel(
            message: "Something went wrong! please try again.");
      }
    } on SocketException {
      // Handle network connection exceptions
    } on HttpException {
      // Handle HTTP request/response exceptions
    } catch (e) {
      return CommonResponseModel(message: e.toString());
    }
  }

  // post method
  Future<dynamic> postMethod(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
  }) async {
    try {
      var result = await post(url, body,
          query: query,
          // headers: headers,
          contentType: contentType,
          uploadProgress: uploadProgress);

      if (result.body != null) {
        if (result.status.isOk) {
          return await result.body;
        } else {
          return CommonResponseModel.fromMap(result.body);
        }
      } else {
        return CommonResponseModel(
            message: "Something went wrong! please try again.");
      }
    } on SocketException {
      // Handle network connection exceptions
    } on HttpException {
      // Handle HTTP request/response exceptions
    } catch (e) {
      log(e.toString());
      return CommonResponseModel(message: e.toString());
    }
  }

  // put method
  Future<dynamic> putMethod(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
  }) async {
    try {
      var result = await put(url, body,
          query: query,
          headers: headers,
          contentType: contentType,
          uploadProgress: uploadProgress);
      if (result.body["status"] == ApiStatus.success.value) {
        return result.body;
      } else {
        return CommonResponseModel.fromMap(result.body);
      }
    } on SocketException {
      // Handle network connection exceptions
    } on HttpException {
      // Handle HTTP request/response exceptions
    } catch (e) {
      return CommonResponseModel(message: e.toString());
    }
  }

  // delete method
Future<dynamic> deleteMethod(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,  
  }) async {
  try {
    var result = await delete(
      url,
      query: query,
      headers: headers,
      contentType: contentType,
      // Pass body here
    );

    // Check if the status is success
    if (result.body["status"] == ApiStatus.success.value) {
      return result.body;
    } else {
      // Handle unsuccessful responses
      return CommonResponseModel.fromMap(result.body);
    }
  } on SocketException {
    // Handle network connection exceptions
    return CommonResponseModel(message: 'No internet connection');
  } on HttpException {
    // Handle HTTP request/response exceptions
    return CommonResponseModel(message: 'HTTP error occurred');
  } catch (e) {
    // Catch any other exceptions
    return CommonResponseModel(message: e.toString());
  }
}


  // patch method
  Future<dynamic> patchMethod(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Progress? uploadProgress}) async {
    try {
      var result = await patch(url, body,
          query: query,
          headers: headers,
          contentType: contentType,
          uploadProgress: uploadProgress);

      if (result.body["status"] == ApiStatus.success.value) {
        return result.body;
      } else {
        // handle non authentication case;
        return CommonResponseModel.fromMap(result.body);
      }
    } on SocketException {
      // Handle network connection exceptions
    } on HttpException {
      // Handle HTTP request/response exceptions
    } catch (e) {
      return CommonResponseModel(message: e.toString());
    }
  }
}
