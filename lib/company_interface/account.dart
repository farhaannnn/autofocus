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
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
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
                      Text(
                        '                    Profile',
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Aboutscreen(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '                    About Us',
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.push(context, PageTransition(child: const Servicescreen(), type: PageTransitionType.rightToLeftWithFade));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '                    Services',
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              color: Colors.black,
              width: 150,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(yellow),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    securestorage.deleteSecureData('email');
                      securestorage.deleteSecureData('role');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          (route) => false);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     PageTransition(
                    //         child: const Loginscreen1(),
                    //         type: PageTransitionType.leftToRightWithFade),
                    //     (route) => false);
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
