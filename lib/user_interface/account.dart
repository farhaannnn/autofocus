
import 'package:auto_focus/company_interface/start.dart';
import 'package:auto_focus/user_interface/aboutus.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Accountscreen1 extends StatelessWidget {
  const Accountscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Accounts',
                  style: GoogleFonts.montserrat(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {Navigator.push(
                          context,
                          PageTransition(
                              child: Profilescreen(),
                              type: PageTransitionType.rightToLeftWithFade));},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.person,color: Colors.black,),
                        Text('My Profile',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.car_rental,color: Colors.black,),
                        Text('My Vehicles',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                      ],
                    )),
                const SizedBox(
                  height: 50,
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
                              child: AboutScreen1(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.info,color: Colors.black,),
                        Text('About Us',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {Navigator.pushAndRemoveUntil(context, PageTransition(child: Startscreen(), type: PageTransitionType.rightToLeftWithFade), (route) => false);},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.work_outline_rounded,color: Colors.black,),
                        Text('Register as Partner',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,)
                      ],
                    )),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.square(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, PageTransition(child: LoginScreen(), type: PageTransitionType.leftToRight), (route) => false);
                    },
                    child: Text(
                      'Logout',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
