import 'package:auto_focus/company_interface/aboutus.dart';
import 'package:auto_focus/company_interface/details.dart';
import 'package:auto_focus/company_interface/home.dart';
import 'package:auto_focus/company_interface/profile.dart';
import 'package:auto_focus/company_interface/signup.dart';
import 'package:auto_focus/company_interface/start.dart';
import 'package:auto_focus/user_interface/intro.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'company_interface/login.dart';
import 'firebase_options.dart';
import 'user_interface/createacc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Splashscreen(),
    );
  }
}
