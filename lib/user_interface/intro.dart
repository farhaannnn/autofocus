import 'package:auto_focus/user_interface/createacc.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/1a6a58f1c30d8bb8ae2e4f5d324c12b2.jpg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    "Auto Focus",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child:  LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.square(50),
                            backgroundColor: Color.fromARGB(255, 249, 224, 3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
