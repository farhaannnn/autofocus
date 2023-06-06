import 'package:auto_focus/user_interface/bottomnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class booking extends StatefulWidget {
  final int id;
  //const booking({super.key});
  booking({required this.id});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  int selectedbuttonindex = 0;
  onbuttonpressed(int buttonindex) {
    setState(() {
      selectedbuttonindex = buttonindex;
    });
  }

  storecollection(String servicedate) async {
    if (widget.id == 1) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('ac_service')
          .doc(servicedate)
          .set({'status': "pending"});
    } else if (widget.id == 2) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('oil_service')
          .doc(servicedate)
          .set({'status': "pending"});
    } else if (widget.id == 3) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('wheel_service')
          .doc(servicedate)
          .set({'status': "pending"});
    } else if (widget.id == 4) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('wash_service')
          .doc(servicedate)
          .set({'status': "pending"});
    }
  }

  // storedetails() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update({
  //     'date': FieldValue.arrayUnion([storeddate]),
  //     'time': FieldValue.arrayUnion([time])
  //   });
  // }

  getpartners() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('partners').get();
    for (var doc in querySnapshot.docs) {
      String data = (doc.data() as Map<String, dynamic>)['companyname'];
      partners.add(data);
    }
  }

  String? data;
  storebooking(String datestored) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    List vehicle = (snap.data() as Map<String, dynamic>)['cars'];

    String name = (snap.data() as Map<String, dynamic>)['name'];
    String bookedservice='ac_service';
    if (widget.id == 1) {
      servicetype = 'ac-service';
      bookedservice = 'ac_service';
    }
    if (widget.id == 2) {
      servicetype = 'oil-service';
      bookedservice = 'oil_service';
    }
    if (widget.id == 3) {
      servicetype = 'wheel-alignment';
      bookedservice = 'wheel_service';
    }
    if (widget.id == 4) {
      servicetype = 'car-wash';
      bookedservice = 'wash_service';
    }
    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(bookedservice)
        .doc(datestored)
        .get();
        String status=(snap2.data() as Map<String,dynamic>)['status'];
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(data)
        .collection('booking_data')
        .doc()
        .set({
      'user-name': name,
      'booked-date': storeddate,
      'time': time,
      'servicetype': servicetype,
      'vehicle': vehicle,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'user-status':status
    });
  }

  searchpartid() async {
    final search = await FirebaseFirestore.instance
        .collection('partners')
        .where('companyname', isEqualTo: valuechoose)
        .get();
    data = (search.docs[0].data() as dynamic)['uid'];
  }

  String? valuechoose;
  List<String> partners = [];
  @override
  void initState() {
    super.initState();
    getaddress();
    getpartners();
  }

  // storepartner() async {
  //   await FirebaseFirestore.instance.collection('partners')
  //   .doc
  // }

  DateTime _date = DateTime.now();
  Future<DateTime?> showDatePickerWithoutTime(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      // Discard the time component by setting the time to midnight (00:00:00)
      return DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    }

    return null;
  }

  String _currtext = 'Choose your date';
  String location = "";
  String address = "";

  String storeddate = "";
  String time = "";
  String servicetype = "ac service";

  getaddress() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      location = (snap.data() as Map<String, dynamic>)['address'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      location = "Please update address in My Profile";
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 19),

              //LOCATION FOR PICKUP CONTAINER
              // Container(
              //   height: 100,
              //   width: 500,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 238, 224, 224),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Column(
              //     children: [
              //       Text('Location for pickup',
              //           style: GoogleFonts.raleway(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 17,
              //               color: Colors.black)),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(
              //           location,
              //           style: GoogleFonts.raleway(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 17,
              //               color: Colors.black),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                // width: 160,
                // height: 60,
                child: DropdownButtonFormField(
                    hint: Text('Select company'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    value: valuechoose,
                    onTap: () {
                      valuechoose = partners[0];
                    },
                    items: partners
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        valuechoose = value as String;
                      });
                      searchpartid();
                    }),
              ),

              const SizedBox(height: 30),

              // DATE PICKER
              Text(
                "Select your preferred date and time.",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  final DateTime? selectedDate =
                      await showDatePickerWithoutTime(context);
                  if (selectedDate != null) {
                    // Handle the selected date without the time component
                    print(selectedDate);
                  }
                  setState(() {
                    _currtext = selectedDate.toString();
                    _currtext = _currtext.substring(0, 10);
                    storeddate = _currtext;
                  });
                },
                color: Colors.red,
                child: Text(
                  _currtext,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(
                height: 23,
              ),

              //PICK TIME SLOT
              Text(
                "Pick Time Slot",
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Divider(
                height: 60,
                color: Colors.red,
                thickness: 0.7,
              ),
              Row(
                children: [
                  const Icon(Icons.timer, color: Colors.red),
                  const SizedBox(
                    width: 6,
                  ),

                  // AFTERNOON SLOTS
                  Text(
                    "Morning Slots",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(1);

                        setState(() {
                          time = "10-11AM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedbuttonindex == 1
                              ? Colors.red
                              : Colors.white,
                          minimumSize: const Size(120, 40)),
                      child: Text(
                        "10-11AM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 1
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(2);
                        setState(() {
                          time = "11-12PM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedbuttonindex == 2
                            ? Colors.red
                            : Colors.white,
                        minimumSize: const Size(120, 40),
                      ),
                      child: Text(
                        "11-12PM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 2
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(3);
                        setState(() {
                          time = "12-1PM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedbuttonindex == 3
                              ? Colors.red
                              : Colors.white,
                          minimumSize: const Size(120, 40)),
                      child: Text(
                        "12-1PM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 3
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 4,
                height: 75,
                color: Colors.red,
                thickness: 0.7,
              ),

              // EVENING SLOTS

              Row(
                children: [
                  const Icon(Icons.timer, color: Colors.red),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Evening Slots",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(4);
                        setState(() {
                          time = "2-3PM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedbuttonindex == 4
                              ? Colors.red
                              : Colors.white,
                          minimumSize: const Size(120, 40)),
                      child: Text(
                        "2-3PM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 4
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(5);
                        setState(() {
                          time = "3-4PM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedbuttonindex == 5
                            ? Colors.red
                            : Colors.white,
                        minimumSize: const Size(120, 40),
                      ),
                      child: Text(
                        "3-4PM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 5
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onbuttonpressed(6);
                        setState(() {
                          time = "4-5PM";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedbuttonindex == 6
                              ? Colors.red
                              : Colors.white,
                          minimumSize: const Size(120, 40)),
                      child: Text(
                        "4-5PM",
                        style: GoogleFonts.montserrat(
                            color: selectedbuttonindex == 6
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 4,
                height: 75,
                color: Colors.red,
                thickness: 0.7,
              ),

              // ORDER TEXT

              //Text(
              // "By placing an order, we will assign you a Mechanic and a Workshop to take care of your car problems.",
              //style: GoogleFonts.raleway(color: Colors.white,
              //     fontWeight: FontWeight.w500, fontSize: 15)),
              //const SizedBox(
              // height: 18,
              // ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      String servicedate = storeddate + "," + time;
                      //storedetails();
                      storecollection(servicedate);
                      storebooking(servicedate);
                      // storepartner();
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const Bottomnav(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(33),
                      //minimumSize: Size(50,40),
                    ),
                    child: Text(
                      "Book now",
                      style: GoogleFonts.raleway(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
