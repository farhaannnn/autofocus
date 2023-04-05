import 'package:auto_focus/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';

class Screencreateaccount1 extends StatelessWidget {
  const Screencreateaccount1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(width: 40,),
              SizedBox(width: double.infinity,height: 100 ,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Let's get",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40)),
                Text('started',style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))],),    ),
              
              const SizedBox(height: 130,),
              TextFormField(    decoration: const InputDecoration(prefixIcon: Icon(Icons.mail),prefixIconColor: Colors.black, 
                filled: true,  hintText: 'Email id',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                fillColor: Color.fromARGB(255, 169, 167, 167)),),
              
              const SizedBox(height: 20),

              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.lock),prefixIconColor: Colors.black,
                 filled: true,   hintText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                 fillColor: Color.fromARGB(255, 169, 167, 167)),),
              
              const SizedBox(height: 20),
              
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.lock),prefixIconColor: Colors.black,
                 filled: true,hintText: 'Confirm Password',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                 fillColor: Color.fromARGB(255, 169, 167, 167)),),
              
              const SizedBox(height: 40),
              
              SizedBox(width: 200,height: 50,child: ElevatedButton(onPressed:()
              {
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const Homescreen()));
              }
              ,style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                 child:  Text('Sign Up',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),))),
              
              const SizedBox(height: 30),
              Text('or continue with',style: GoogleFonts.montserrat(color: Colors.white),),
              const SizedBox(height: 20),
              
              SizedBox(width: 300,height: 40,
                child: SignInButton(
                Buttons.Google,
                text: "Google",
                onPressed: () {},),
              ),
              const SizedBox(height: 20),


              //SizedBox(width: double.infinity,height:50,
                //child: Row(mainAxisAlignment: MainAxisAlignment.center,    children: [
                 // Text('Already have an account?',style: GoogleFonts.montserrat(color: Colors.white)),
                 // TextButton(onPressed: ()
                 // {},
                 //  child: Text('Login',style: GoogleFonts.montserrat(color: Colors.white)))
                //],),
              //),
              TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text('back'))
            ],
          ),
        ),
      )),
    );
  }
}