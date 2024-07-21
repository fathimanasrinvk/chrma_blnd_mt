import 'package:chromablend_mt/presentation/login_screen/controller/login_controller.dart';
import 'package:chromablend_mt/presentation/login_screen/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => loginController(),)
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  LoginScreen(),
    );
  }
}

