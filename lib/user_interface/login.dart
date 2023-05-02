import 'package:auto_focus/company_interface/start.dart';
import 'package:auto_focus/user_interface/bottomnav.dart';
import 'package:auto_focus/user_interface/createacc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../services/auth_services.dart';
import 'home.dart';
//import 'package:google_fonts/google_fonts.dart';
//Testing Commits//

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  _loginuser() async {
    String email = _emailcontroller.text.trim();
    String password = _passwordcontroller.text.trim();
    String res = await AuthServices.login(email: email, password: password);
    if (res != "success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          'Invalid Username or Password',
          style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ));
      return;
    }
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: const Bottomnav()));
  }

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
                height: 10,
              ),
              Container(
                alignment: FractionalOffset.topLeft,
                child: Text(
                  "Hey,\nWelcome Back",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),

              //EMAIL TEXTFIELD
              Center(
                  child: SizedBox(
                width: 380,
                child: TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        prefixIconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: "Email ID",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                        ))),
              )),
              const SizedBox(
                height: 50,
              ),

              // PASSWORD TEXTFIELD

              Center(
                  child: SizedBox(
                width: 380,
                child: TextFormField(
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                        ))),
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
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const Screencreateaccount1()));
                        },
                        child: Text(
                          ' Register',
                          style: GoogleFonts.montserrat(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const Startscreen(),
                                  type: PageTransitionType.bottomToTop));
                          //print("Pressed");
                        },
                        child: SingleChildScrollView(
                          child: Text(
                            "Service Provider?",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //LOGIN BUTTON
              ElevatedButton(
                onPressed: () {
                  _loginuser();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //SIGN IN WITH GOOGLE TEXT

              Text(
                "Or sign in with Google",
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: SignInButton(
                  Buttons.Google,
                  text: "Google",
                  onPressed: () {},
                ),
              ),
              //TextButton(onPressed: (){
              //Navigator.pop(context);
              //}, child: const Text('back'))

              //GOOGLE LOGIN ICON
            ]),
          ),
        ),
      ),
    );
  }
}
