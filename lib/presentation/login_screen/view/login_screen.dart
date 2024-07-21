import 'package:chromablend_mt/presentation/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/global_textstyle.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        backgroundColor: ColorTheme.secondarycolor,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          SizedBox(
            height: size * 100,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size * 35, right: size * 35, top: size * 100),
            child: TextFormField(
              controller: usernamecontroller,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: ColorTheme.maincolor,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding: EdgeInsets.symmetric(horizontal: size * 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size * 35, right: size * 35, top: size * 30),
            child: TextFormField(
              controller: passwordcontroller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: ColorTheme.maincolor,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: size * 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none),
              ),
              style: TextStyle(color: ColorTheme.maincolor),
            ),
          ),
          SizedBox(
            height: size * 40,
          ),
          Container(
            width: size * 250,
            decoration: BoxDecoration(
                color: ColorTheme.maincolor,
                borderRadius: BorderRadius.circular(size * 7)),
            child: ElevatedButton(
              onPressed: () async {
                Provider.of<loginController>(context,listen: false).onLogin(
                    usernamecontroller.text.trim(),
                    passwordcontroller.text.trim(),
                    context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.maincolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              child: Text("Login", style: GlobalTextStyles.buttonText),
            ),
          ),
        ]))));
  }
}
