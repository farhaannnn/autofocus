import 'package:auto_focus/company_interface/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Detailscreen extends StatelessWidget {
  Detailscreen({super.key});
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Heading
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 5),
              child: Text(
                'Become Auto Focus Partner',
                style: GoogleFonts.montserrat(
                    color: const Color(0xFFFED604), fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //enter name
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    prefixIconColor: Colors.black,
                    hintText: 'Enter Name',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    fillColor: Color(grey),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //enter organization name
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.apartment),
                    prefixIconColor: Colors.black,
                    hintText: 'Enter Organization name',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    fillColor: Color(grey),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //enter address
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.maps_home_work),
                  prefixIconColor: Colors.black,
                  hintText: 'Enter Address',
                  hintStyle: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w100),
                  fillColor: Color(grey),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                minLines: 3,
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //PAN number
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.credit_card_sharp),
                    prefixIconColor: Colors.black,
                    hintText: 'Enter PAN Number',
                    hintStyle: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100),
                    fillColor: Color(grey),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 60,
            ),

            //Submit
            Container(
              color: Colors.black,
              height: 40,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(yellow),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const Signupscreen(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                  child: Text(
                    'Submit',
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
