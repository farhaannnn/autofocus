import 'package:auto_focus/company_interface/details.dart';
import 'package:auto_focus/company_interface/home.dart';
import 'package:auto_focus/company_interface/signup.dart';
import 'package:auto_focus/company_interface/start.dart';
import 'package:auto_focus/user_interface/intro.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'company_interface/login.dart';
import 'user_interface/createacc.dart';

void main() 
{
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
 
  
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home:   Homescreen1(),
    );
  }
}
