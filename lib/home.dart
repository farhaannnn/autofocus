import 'package:auto_focus/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [const Text('HELLO'),ElevatedButton(onPressed: ()
      {
        //Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const LoginScreen()));
        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const LoginScreen()), (route) => false);
      }, child: const Text('LOGOUT'))],)),
      
    );
  }
}