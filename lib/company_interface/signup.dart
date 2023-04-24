import 'package:auto_focus/company_interface/home.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

//Myr
class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});
  static const grey = 0xFF9D9D9D;
  static const yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("Let's get",
                          style: GoogleFonts.montserrat(
                              color: const Color(yellow),
                              fontWeight: FontWeight.bold,
                              fontSize: 28)),
                    ),
                    Text('started',
                        style: GoogleFonts.montserrat(
                            color: const Color(yellow),
                            fontWeight: FontWeight.bold,
                            fontSize: 28))
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Email id',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: const Color(grey)),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Password',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: const Color(grey)),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: const Color(grey)),
              ),
              const SizedBox(height: 60),
              SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const Homescreen1(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(yellow),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))),
            ],
          ),
        ),
      )),
    );
  }
}
