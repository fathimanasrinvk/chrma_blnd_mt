import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../config/app_config.dart';


class ApiHelper {
  //for get
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("url -> $url");
    try {
      var response = await http.get(url, headers: header);
      log("getData -> Status code -> ${response.statusCode}");
      log("response -> ${response.body.toString()}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log("$decodedData");
        return decodedData;
      } else {
        log("Else Condition >> Api failed");
      }
    } catch (e) {
      log("$e");
    }
  }



  //for post
  static postData({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    log("input $body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url -> url");
    try {
      var response = await http.post(url, body: body, headers: header);
      log("StatusCode -> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log("Api Failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }


  //for patch
  static Future<dynamic> patchData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("input $body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("url -> $url");
    try {
      var response = await http.patch(url, body: body, headers: header);
      log("StatusCode -> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log("Api Failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }

  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }


  static Future<dynamic> delete({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    log("Api-helper -> delete()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header -> $header");
    log("final url -> $url");
    try {
      var response = await http.delete(url, headers: header, body: body);
      log("ApiHelper -> Api Called -> status code=${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        var decodedData = jsonDecode(response.body);
        log("Else Condition -> Api failed -> ${decodedData.toString()}");
        return decodedData;
      }
    } catch (e) {
      log("Error in delete: $e");
      return {"status": 0, "message": "An error occurred"};
    }
  }
}