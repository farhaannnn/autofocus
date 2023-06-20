import 'package:auto_focus/company_interface/home.dart';
import 'package:auto_focus/user_interface/bottomnav.dart';
import 'package:auto_focus/user_interface/createacc.dart';
import 'package:auto_focus/user_interface/home.dart';
import 'package:auto_focus/user_interface/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:auto_focus/storage.dart';

String? finalEmail, finalRole;

class Splashscreen extends StatefulWidget {
  String? title;
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('role').then((value) {
      finalRole = value;
    });
    // TODO: implement initState
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: Image.asset(
            'assets/logo.jpg',
            width: 170,
            height: 170,
          )),
        )));
  }

  Future<void> start() async {
    await Future.delayed(const Duration(seconds: 1));
    if (finalEmail == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Intro1()));
    } else if (finalRole.toString() == 'USER' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomnav()));
    } else if (finalRole.toString() == 'PARTNER' && finalEmail != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homescreen1()));
    }
   
  }
}
