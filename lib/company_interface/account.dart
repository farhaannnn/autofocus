import 'package:auto_focus/company_interface/aboutus.dart';
import 'package:auto_focus/company_interface/login.dart';
import 'package:auto_focus/company_interface/profile.dart';
import 'package:auto_focus/company_interface/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../storage.dart';
import '../user_interface/login.dart';

class Accountscreen extends StatelessWidget {
  final securestorage = SecureStorage();
  Accountscreen({super.key});
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Account',
                style: GoogleFonts.montserrat(
                    color: Color(yellow),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                  
                     onPressed: () {
                
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const Profilescreen(),
                            type: PageTransitionType.rightToLeftWithFade));
                  }, 
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.account_circle_rounded,
                          color: Colors.black,
                        ),
                        Text('Profile',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),

          
    
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.square(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.yellow),
                    onPressed: () {
                      securestorage.deleteSecureData('email');
                      securestorage.deleteSecureData('role');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          (route) => false);
                      
                    },
                    child: Text(
                      'Logout',
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ))
          ]
          ,
        ),
      )),
    );
  }
}
