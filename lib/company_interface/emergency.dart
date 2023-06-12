import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

var grey = 0xFF9D9D9D;
var yellow = 0xFFFED604;
void acceptbooking(String name, String vehicle) async {
  final query = await FirebaseFirestore.instance
      .collection('partners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('booking_data')
      .where('status', isEqualTo: 'Emergency')
      .where('name', isEqualTo: name)
      .where('vehicle', isEqualTo: vehicle)
      .get();
  print('query.docs[0].id');
  await FirebaseFirestore.instance
      .collection('partners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('booking_data')
      .doc(query.docs[0].id)
      .update({'status': 'Emergency Accepted'});
  QuerySnapshot querysnapshot =
      await FirebaseFirestore.instance.collection('partners').get();
  for (var doc in querysnapshot.docs) {
    final query2 = await FirebaseFirestore.instance
        .collection('partners')
        .doc(doc.id)
        .collection('booking_data')
        .where('status', isEqualTo: 'Emergency')
        .where('name', isEqualTo: name)
        .where('vehicle', isEqualTo: vehicle)
        .get();
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(doc.id)
        .collection('booking_data')
        .doc(query2.docs[0].id)
        .delete();
  }
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Emergency Requests",
              style: GoogleFonts.montserrat(
                  color: Color(yellow),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
                    .where('status', isEqualTo: 'Emergency')
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
                              color: Color(yellow)),
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
                                        ['name'],
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
                                            "Emergency",
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
                                              .docs[index]['vehicle'],
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                //visible: visibility,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          acceptbooking(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['name'],
                                            (snapshot.data! as dynamic)
                                                .docs[index]['vehicle'],
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        child: Text(
                                          'Accept',
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),

                                    //     icon: const Icon(Icons.cancel_rounded)),
                                  ],
                                ),
                              ),
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
