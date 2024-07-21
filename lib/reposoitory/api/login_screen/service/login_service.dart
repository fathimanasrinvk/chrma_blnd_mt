import 'dart:developer';

import '../../../helper/api_helper.dart';


class LoginService {
  static Future<dynamic> postLoginData(Map<String, dynamic> data) async {
    try {
      var decodedData =
      await ApiHelper.postData(endPoint: "/api/auth/admin/login", body: data);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}