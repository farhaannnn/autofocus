import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutscreen extends StatelessWidget {
  Aboutscreen({super.key});
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Text('About Us',
                      style: GoogleFonts.montserrat(
                          color: Color(yellow),
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text(
                  "24/7 Car & Bike Breakdown Assistance Service Across India.\n\n\nGet your hands on our AutoFocus-SuperApp and enjoy 24/7 worry free driving across India.\n You're just a click away from experiencing easy bookings, instant services, exclusive deals and subscriptions.\n\n\nAutoFocus provides 24/7 on the spot breakdown support, flat tyre, puncture repairs, stepney change, fixes for starting problems, battery jumpstart, minor repairs, emergency fuel delivery, key unlock assistance, accidental recovery & towing service to customers through on-demand services. AutoFocus services are available across any nook and corner of India to our subscribed customers.\nAutoFocus intends to be the best roadside assistance provider in India by addressing the real time vehicle breakdown problems of customers using deep machine learning,data intelligence and operations efficiency.\n We are headquartered in Bangalore, the beautiful garden city of India and also fondly called as the silicon valley of India among the startup ecosystem.",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
