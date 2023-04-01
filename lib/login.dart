import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
//import 'package:google_fonts/google_fonts.dart';
//Testing Commits//

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: FractionalOffset.topLeft,
              child: const Text(
                "Hey,\nWelcome Back.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),

            //EMAIL TEXTFIELD
            Center(
                child: SizedBox(
              width: 380,
              child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: "Email ID",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                      ))),
            )),
            const SizedBox(
              height: 17,
            ),

            // PASSWORD TEXTFIELD

            Center(
                child: SizedBox(
              width: 380,
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
            Container(
              alignment: FractionalOffset.centerRight,
              child: TextButton(
                  onPressed: () {
                    //print("Pressed");
                  },
                  child: const Text(
                    "Forgot Password? ",
                    style: TextStyle (color: Colors.white),
                  )),
            ),

            //LOGIN BUTTON
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //SIGN IN WITH GOOGLE TEXT
            const Text(
              "Or sign in with Google",
              style:TextStyle(color: Colors.grey),
            ),
           SizedBox(width: 300,height: 40,
                child: SignInButton(
                Buttons.Google,
                text: "Google",
                onPressed: () {},),
              )

            //GOOGLE LOGIN ICON
         ,
          ]),
        
      ),
    );
  }
}