import 'dart:convert';
import 'dart:developer';

import 'package:chromablend_mt/presentation/home_screen/view/home_screeen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_config.dart';
import '../../../core/utils/app_utils.dart';
import '../../../reposoitory/api/login_screen/service/login_service.dart';

class loginController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  Future onLogin(String username, String password, BuildContext context) async {
    log("loginController -> onLogin() started");
    var data = {"username": username, "password": password};
    LoginService.postLoginData(data).then((value) {
      log("postLoginData() -> ${value["data"]["admin"]["status"]}");
      if (value["data"]["admin"]["status"] == "ACTIVE") {
        log("token -> ${value["data"]["access_token"]}");
        storeLoginData(value);
        storeUserToken(value["data"]["access_token"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
      } else {
        var message = value["errors"].toString();
        AppUtils.oneTimeSnackBar(message, context: context,bgColor: Colors.red);
      }
    });
  }


  void storeLoginData(loginReceivedData) async {
    log("storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(loginReceivedData);
    sharedPreferences.setString(AppConfig.loginData, storeData);
    sharedPreferences.setBool(AppConfig.loggedIn, true);
  }

  void storeUserToken(resData) async {
    log("storeUserToken");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }
}