import 'package:auto_focus/company_interface/details.dart';
import 'package:auto_focus/company_interface/login.dart';
import 'package:auto_focus/company_interface/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Android Small - 2.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          children: [
            // intro message

            const SizedBox(height: 580),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Join AutoFocus as a Service Provider and boost your automotive service business',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Login button

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFED604),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const Loginscreen1(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Text('Login',
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600))),
                  //Signup button

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFED604),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child:  Detailscreen(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Text('Sign Up',
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600)))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
