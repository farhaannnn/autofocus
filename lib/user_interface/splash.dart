

import 'package:auto_focus/user_interface/createacc.dart';
import 'package:auto_focus/user_interface/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

class Splashscreen extends StatefulWidget {
  
  
  
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Center(child: Image.asset('assets/logo.jpg',width: 170,height: 170,) ),
      ))
    );
  }

  Future<void>start()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: const Intro1()));
}
}