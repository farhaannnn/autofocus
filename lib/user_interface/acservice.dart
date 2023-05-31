import 'package:auto_focus/user_interface/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ACServiceScreen extends StatelessWidget {
   ACServiceScreen({super.key});
  int id=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: [
            const SizedBox(height: 10),
            Center(
                child: Text(
              "AC SERVICE",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/WhatsApp Image 2023-05-03 at 7.09.54 PM.jpeg',
              width: 5000,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Colors.red,
                        ),
                        Text(
                          "Go Digital",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        const Icon(
                          Icons.handshake,
                          color: Colors.red,
                        ),
                        Text("Our Promise",
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15))
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.fire_truck,
                          color: Colors.red,
                        ),
                        Text("Pick-Up and Drop",
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.support_agent,
                          color: Colors.red,
                        ),
                        Text(
                          "Expert Service",
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: const [
              SizedBox(height: 15),
            ]),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Salient Features",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  )),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "-Restore car's cooling efficiency\n\n-AC Cooling check\n\n- AC Gas refueling",
                            style: GoogleFonts.raleway(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, PageTransition(child: booking(id: 1,), type: PageTransitionType.rightToLeftWithFade));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.red)))),
                  child: Text(
                    "BOOK YOUR SERVICE",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
