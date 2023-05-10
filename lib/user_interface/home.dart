import 'package:auto_focus/user_interface/acservice.dart';
import 'package:auto_focus/user_interface/alignment.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'carwash.dart';
import 'oilservice.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Home',
              style: GoogleFonts.montserrat(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          '         ADD YOUR ',
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          'VEHICLE',
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(width: 105),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.black,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Image.asset('assets/car (1).jpg'),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                )),
          ),
          SizedBox(height: 50,),
             Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const ACServiceScreen(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const Text('ac')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const OilServiceScreen(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const Text('oil')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const WheelalignmentScreen(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const Text('wheel')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const CarwashScreen(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const Text('wash')),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),
                    Center(child: Text('Locate nearby service stations',style: GoogleFonts.raleway(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),)),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,right: 50),
                      child: Container(height: 110,width: double.infinity,color: Colors.grey,child: Icon(Icons.location_on,color: Colors.red,size: 50,),),
                    )
        ],
      )),
    );
  }
}
