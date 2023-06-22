import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Emergencyhistory extends StatefulWidget {
  const Emergencyhistory({super.key});

  @override
  State<Emergencyhistory> createState() => _EmergencyhistoryState();
}

class _EmergencyhistoryState extends State<Emergencyhistory> {
  completebooking(String name, String vehicle) async {
    final query = await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .where('name', isEqualTo: name)
        .where('vehicle', isEqualTo: vehicle)
        .where('status', isEqualTo: 'Emergency Accepted')
        .get();
    String uid = (query.docs[0].id);

    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection('partners')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection('booking_data')
    //     .where('user-name', isEqualTo: name)
    //     .get();
    // String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('partners')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking_data')
        .doc(uid)
        .delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
           
            Text('Emergency History',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,color: Colors.yellow,fontSize: 22),),
             SizedBox(height: 18,),
            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('partners')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('booking_data')
                    .where('status', isEqualTo: 'Emergency Accepted')
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                      shrinkWrap: true,
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
                                    Icons.person_pin,
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
                                            'Emergency Service',
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
                              const Divider(
                                height: 20,
                                thickness: 0.7,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    completebooking(
                                      (snapshot.data! as dynamic).docs[index]
                                          ['name'],
                                      (snapshot.data! as dynamic).docs[index]
                                          ['vehicle'],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 21, 112, 249)),
                                  child: Text(
                                    'Completed',
                                    style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
