import 'package:auto_focus/company_interface/login.dart';
import 'package:auto_focus/services/auth_services.dart';
import 'package:auto_focus/user_interface/bottomnav.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';

class Screencreateaccount1 extends StatefulWidget {
  const Screencreateaccount1({super.key});

  @override
  State<Screencreateaccount1> createState() => _Screencreateaccount1State();
}

class _Screencreateaccount1State extends State<Screencreateaccount1> {

  _Screencreateaccount1State()
  {
    valuechoose=selectList[0];
  }
  final _emailcontroller = TextEditingController();
  final _passwordcontroller2 = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namecontroller=TextEditingController();
  List selectList=['USER','PARTNER'];
    String? valuechoose;

  _signup() async {
    String email = _emailcontroller.text.trim();
    String password = _passwordcontroller.text.trim();
    String password2 = _passwordcontroller2.text.trim();
    String name=_namecontroller.text.trim();
    String role=valuechoose.toString();
    //check if any fields are empty

    if (email.isEmpty || password.isEmpty || password2.isEmpty||name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text(
            'One or more fields are empty',
            style:
                GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w600),
          )));
    } else {
      //check if both passwords are equal

      if (password == password2) {
        String res =
            await AuthServices.signup(email: email, password: password,name: name,role: role);
        if (res != "success") {
          print(res);
          return;
        }
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child:  LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Text(
              "Passwords don't match",
              style: GoogleFonts.raleway(
                  fontSize: 15, fontWeight: FontWeight.w600),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(width: 40,),
              SizedBox(
                width: double.infinity,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Let's get",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                    Text('started',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40))
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller:_namecontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_4),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: Color.fromARGB(255, 169, 167, 167)),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Email id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: Color.fromARGB(255, 169, 167, 167)),
              ),

              const SizedBox(height: 20),

              TextFormField(obscureText: true,
                controller: _passwordcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: Color.fromARGB(255, 169, 167, 167)),
              ),

              const SizedBox(height: 20),

              TextFormField(obscureText: true,
                controller: _passwordcontroller2,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.black,
                    filled: true,
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    fillColor: Color.fromARGB(255, 169, 167, 167)),
              ),

              const SizedBox(height: 40),

              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        _signup();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))),

              const SizedBox(height: 20),
             
              const SizedBox(height: 20),
              Container(height: 60,width: 150,
                child: DropdownButtonFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),  fillColor: Colors.white,filled: true,hintText: 'Select'),
                  value: valuechoose,
                  onTap: () {},
                  items: selectList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      valuechoose = value as String;
                    });
                  }),
              )

              //SizedBox(width: double.infinity,height:50,
              //child: Row(mainAxisAlignment: MainAxisAlignment.center,    children: [
              // Text('Already have an account?',style: GoogleFonts.montserrat(color: Colors.white)),
              // TextButton(onPressed: ()
              // {},
              //  child: Text('Login',style: GoogleFonts.montserrat(color: Colors.white)))
              //],),
              //),
            ],
          ),
        ),
      )),
    );
  }
}
