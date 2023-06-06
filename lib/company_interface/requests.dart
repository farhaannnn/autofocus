import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Requestscreen extends StatefulWidget {
  Requestscreen({super.key});

  @override
  State<Requestscreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<Requestscreen> {
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getinfo();
  }

  bool visibility = true;
  List<String> datelist = [];
  List<String> timelist = [];
  List<String> servicelist = [];
  List<String> usernamelist = [];

  Future<bool> getstatus(
      String name, String service, String date, String time) async {
    final query = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .where('user-name', isEqualTo: name)
        .where('servicetype', isEqualTo: service)
        .where('booked-date', isEqualTo: date)
        .where('time', isEqualTo: time)
        .get();
    String uid = (query.docs[0].data() as Map<String, dynamic>)['uid'];
    String docdate = date + ',' + time;
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('booking_data')
        .doc(docdate)
        .get();
    String status = (snap.data() as Map<String, dynamic>)['status'];
    if (status == 'pending') {
      return true;
    } else {
      return false;
    }
  }

  cancelbooking(String name, String service, String date, String time) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .where('user-name', isEqualTo: name)
        .where('servicetype', isEqualTo: service)
        .where('booked-date', isEqualTo: date)
        .where('time', isEqualTo: time)
        .get();
    String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .doc(id)
        .delete();
    setState(() {});
  }

  confirmbooking(String name, String service, String date, String time) async {
    final query = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .where('user-name', isEqualTo: name)
        .where('servicetype', isEqualTo: service)
        .where('booked-date', isEqualTo: date)
        .where('time', isEqualTo: time)
        .get();
    String uid = (query.docs[0].data() as Map<String, dynamic>)['uid'];
    String docdate = date + ',' + time;
    String id = query.docs[0].id;
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .doc(id)
        .update({'user-status': 'Accepted'});
    if (service == 'ac-service') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('ac_service')
          .doc(docdate)
          .update({'status': 'Accepted'});
    } else if (service == 'oil-service') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('oil_service')
          .doc(docdate)
          .update({'status': 'Accepted'});
    } else if (service == 'wheel-alignment') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('wheel_service')
          .doc(docdate)
          .update({'status': 'Accepted'});
    } else if (service == 'wash-service') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('wash_service')
          .doc(docdate)
          .update({'status': 'Accepted'});
    }
    setState(() {
      
    });
    return 'Accepted';
  }

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
              height: 1,
            ),
            Center(
              child: Text(
                'Pending requests',
                style: GoogleFonts.montserrat(
                    color: Color(yellow),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('partners')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('booking_data')
                    .where('user-status', isEqualTo: 'pending')
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                      itemCount: (snapshot.data! as dynamic).docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white,
                          ),
                          // height: 150,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_rounded,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    (snapshot.data! as dynamic).docs[index]
                                        ['user-name'],
                                    style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Service:',
                                            style: GoogleFonts.raleway(
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['servicetype'],
                                            style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Vehicle Name:',
                                          style: GoogleFonts.raleway(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['vehicle'][0],
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 20,
                                thickness: 0.7,
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Booking Date:',
                                            style: GoogleFonts.raleway(
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['booked-date'],
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Booking Time:',
                                          style: GoogleFonts.raleway(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['time'],
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Visibility(
                                //visible: visibility,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          confirmbooking(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['user-name'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['servicetype'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['booked-date'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['time'],
                                          );
                                          setState(() {
                                            visibility = !visibility;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        child: Text(
                                          'Accept',
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          cancelbooking(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['user-name'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['servicetype'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['booked-date'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['time'],
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text(
                                          'Decline',
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))

                                    //     icon: const Icon(Icons.cancel_rounded)),
                                  ],
                                ),
                              ),
                              // Visibility(
                              //   //visible: !visibility,
                              //   child: ElevatedButton(
                              //       onPressed: () {
                              //         completebooking(
                              //           (snapshot.data! as dynamic).docs[index]
                              //               ['user-name'],
                              //           (snapshot.data! as dynamic).docs[index]
                              //               ['servicetype'],
                              //           (snapshot.data! as dynamic).docs[index]
                              //               ['booked-date'],
                              //           (snapshot.data! as dynamic).docs[index]
                              //               ['time'],
                              //         );
                              //       },
                              //       style: ElevatedButton.styleFrom(
                              //           backgroundColor:
                              //               Color.fromARGB(255, 21, 112, 249)),
                              //       child: Text(
                              //         'Completed',
                              //         style: GoogleFonts.raleway(
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.white),
                              //       )),
                              // ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ));
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
