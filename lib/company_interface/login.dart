import 'package:auto_focus/company_interface/details.dart';
import 'package:auto_focus/company_interface/home.dart';
import 'package:auto_focus/company_interface/signup.dart';
import 'package:auto_focus/user_interface/createacc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

//import 'package:google_fonts/google_fonts.dart';
//Testing Commits//

class Loginscreen1 extends StatelessWidget {
  const Loginscreen1({super.key});
  static const grey = 0xFF9D9D9D;
  static const yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: FractionalOffset.topLeft,
                child: Text(
                  "Hey,\nWelcome Back",
                  style: GoogleFonts.montserrat(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(yellow),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              //EMAIL TEXTFIELD
              Center(
                  child: SizedBox(
                width: 380,
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        prefixIconColor: Colors.black,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: const Color(grey),
                        hintText: "Email ID",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w100))),
              )),
              const SizedBox(
                height: 40,
              ),

              // PASSWORD TEXTFIELD

              Center(
                  child: SizedBox(
                width: 380,
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: Colors.black,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: "Password",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w100))),
              )),
              const SizedBox(height: 5),

              //FORGOT PASSWORD
              SizedBox(
                //alignment: FractionalOffset.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child:  Detailscreen(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Text(
                          'New user? Register',
                          style: GoogleFonts.raleway(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {
                          //print("Pressed");
                        },
                        child: SingleChildScrollView(
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.raleway(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //LOGIN BUTTON
              ElevatedButton(
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
                  "Login",
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
