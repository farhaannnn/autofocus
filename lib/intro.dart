import 'package:auto_focus/createacc.dart';
import 'package:auto_focus/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body:SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
             SizedBox(child: Text("Auto Focus",style:GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40) ,),),
             const SizedBox(height: 600,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const Screencreateaccount1()));
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              child: Text('Sign Up',style: GoogleFonts.montserrat(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const LoginScreen()));
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              child: Text('Login',style: GoogleFonts.montserrat(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))
            ],)
          ],
        ),
      ),
    ))

    );
  }
}