import 'package:auto_focus/m_y_i_c_o_n_s_icons.dart';
import 'package:auto_focus/user_interface/acservice.dart';
import 'package:auto_focus/user_interface/alignment.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/searchscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

String? _name;
String? _mobile;
void emergency() async {
  DocumentSnapshot snap = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  _name = (snap.data() as Map<String, dynamic>)['name'];
  _mobile = (snap.data() as Map<String, dynamic>)['mobile'];
  print(_name);
  print(_mobile);
  String _vehicle = (snap.data() as Map<String, dynamic>)['cars'][0];

  QuerySnapshot querysnapshot =
      await FirebaseFirestore.instance.collection('partners').get();
  for (var doc in querysnapshot.docs) {
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(doc.id)
        .collection('booking_data')
        .doc()
        .set({
      'name': _name,
      'mobile': _mobile,
      'vehicle': _vehicle,
      'status': 'Emergency'
    });
  }
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const Searchscreen(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          },
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
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: ACServiceScreen(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Icon(
                      MYICONS.ac_unit,
                      color: Colors.black,
                    )),
              ),
              Container(
                width: 60,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const OilServiceScreen(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Icon(
                      MYICONS.oil_can,
                      color: Colors.black,
                    )),
              ),
              Container(
                width: 60,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const WheelalignmentScreen(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Icon(
                      MYICONS.cog_wheel,
                      color: Colors.black,
                    )),
              ),
              Container(
                width: 60,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const CarwashScreen(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Icon(
                      MYICONS.local_car_wash,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                'ac service',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                'oil service',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'wheel alignment',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                'car wash',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            'Locate nearby service stations',
            style: GoogleFonts.raleway(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              height: 110,
              width: double.infinity,
              color: Colors.black,
              child: IconButton(
                icon: Icon(Icons.location_pin),
                onPressed: () {
                  emergency();
                },
                iconSize: 50,
                splashColor: Colors.red,
                color: Colors.red,
              ),
            ),
          )
        ],
      )),
    );
  }
}
