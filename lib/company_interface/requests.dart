import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  List<String> datelist = [];
  List<String> timelist = [];
  List<String> servicelist = [];
  List<String> usernamelist = [];
  getinfo() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .get();
    for (var document in querySnapshot.docs) {
      String date = (document.data() as Map<String, dynamic>)['booked-date'];
      String time = (document.data() as Map<String, dynamic>)['time'];
      String servicetype =
          (document.data() as Map<String, dynamic>)['servicetype'];
      String username = (document.data() as Map<String, dynamic>)['user-name'];
      datelist.add(date);
      timelist.add(time);
      servicelist.add(servicetype);
      usernamelist.add(username);
    }
  }

  cancelbooking(String name, String service) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .where('user-name', isEqualTo: name)
        .where('servicetype', isEqualTo: service)
        .get();
    String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .doc(id)
        .delete();
        setState(() {
          
        });
  }
confirmbooking()async{
  
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
              height: 20,
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
            Expanded(
              child: FutureBuilder(
                
                future: FirebaseFirestore.instance
                    .collection('partners')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('booking_data')
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white,
                          ),
                          height: 150,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_rounded,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    (snapshot.data! as dynamic).docs[index]
                                        ['user-name'],
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600),
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
                                          const Text('Service'),
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['servicetype'],
                                          ),
                                        ]),
                                  ),
                                  const Text('Vehicle Name'),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        confirmbooking();
                                      },
                                      icon: const Icon(Icons.check_circle)),
                                  IconButton(
                                      onPressed: () {
                                           cancelbooking(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['user-name'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['servicetype']);
                                      },
                                      icon: const Icon(Icons.cancel_rounded)),
                                ],
                              )

                              // Text(
                              //   (snapshot.data! as dynamic).docs[index]
                              //       ['booked-date'],
                              // ),

                              // Text(
                              //   (snapshot.data! as dynamic).docs[index]['time'],
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
