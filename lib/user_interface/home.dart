import 'dart:ffi';

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
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../company_interface/emergency.dart';
import '../map.dart';
import 'carwash.dart';
import 'oilservice.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

String? _name;
String? _mobile;
double _latitude = 0.0;
double _longtitude = 0.0;
String _locationData = '';
// String set = 'no';
// ispresent() async {
//   DocumentSnapshot snap = await FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('emergency-data')
//       .doc()
//       .get();
//   if (snap.exists) {
//     set = 'yes';
//   }
//   set = 'no';
// }
void locationdata() async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({'latitude': _latitude, 'longitude': _longtitude});
}

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
      'status': 'Emergency',
      'latitude': _latitude,
      'longitude':_longtitude,
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }
}

class _HomescreenState extends State<Homescreen> {
  String cname = "";
  String cnum = "";
  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _locationData = 'Location services are disabled.';
      setState(() {});
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _locationData = 'Location permissions are denied.';
        setState(() {});
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _locationData =
          'Location permissions are permanently denied, we cannot request permissions.';
      setState(() {});
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _locationData =
        'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
    _latitude = position.latitude;
    _longtitude = position.longitude;
  }

  getsnap() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('emergency_data')
        .get();
    print(snap.docs[0]);
    DocumentSnapshot documentSnapshot = snap.docs[0];
    cname = (documentSnapshot.data() as Map<String, dynamic>)['company-name'];
    cnum = (documentSnapshot.data() as Map<String, dynamic>)['company-mobile'];
    print(cname);
    print(cnum);
    setState(() {});
  }

  late DocumentSnapshot snap1;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getsnap();
    getCurrentLocation();
  }

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
                ' ac service',
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
            height: 35,
          ),
          Center(
              child: Text(
            'Alert all service stations',
            style: GoogleFonts.raleway(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          )),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              height: 110,
              width: double.infinity,
              color: Colors.black,
              child: IconButton(
                icon: const Icon(Icons.location_pin),
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              'Alert Stations?',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel',
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold,
                                      ))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    emergency();
                                    locationdata();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            duration:
                                                const Duration(seconds: 3),
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                'All service providers have been alerted !')));
                                  },
                                  child: Text('Ok',
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold,
                                      )))
                            ],
                          ));
                },
                iconSize: 50,
                splashColor: Colors.red,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          if (cname != "" && cnum != "")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    // barrierColor: ,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          //color: Color(grey),
                          height: 160,
                          child: Column(
                            children: [
                              Text(
                                'Mechanic Details',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const Divider(
                                thickness: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Company Name: $cname',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('Mobile No: $cnum',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 8,
                              ),
                              const Icon(
                                Icons.car_repair_rounded,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Help is on the way',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            )
          else if (cname == "" || cnum == "")
            Container(
              color: Colors.transparent,
            )
        ],
      )),
    );
  }
}
