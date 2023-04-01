import 'package:auto_focus/createacc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
//Testing Commits//

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  

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
                  child:  Text(
                    "Hey,\nWelcome Back",
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
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
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.mail),prefixIconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.lock),prefixIconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: ()
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx1)=>const Screencreateaccount1()));
                      },
                     child:  Text('New user?Register',style: GoogleFonts.montserrat(color: Colors.white),)),
                      
                      TextButton(
                          onPressed: () {
                            //print("Pressed");
                          },
                          child:  Text(
                            "Forgot Password? ",
                            style: GoogleFonts.montserrat (color: Colors.white),
                          )),
                    ],
                  ),
                ),
                      
                //LOGIN BUTTON
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child:  Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                      
                //SIGN IN WITH GOOGLE TEXT
                
                 Text(
                  "Or sign in with Google",
                  style:GoogleFonts.montserrat(color: Colors.grey),
                ),
                const SizedBox(height: 10,),
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
          ),
        
      ),
    );
  }
}