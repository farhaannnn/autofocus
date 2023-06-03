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
    getinfo();
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
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Date :${usernamelist[index]}'),
                              Text('Date :${datelist[index]}'),
                              Text('Time${timelist[index]}'),
                            ]),
                          ),
                          Container(
                              child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.check_circle)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.cancel_rounded))
                            ],
                          )),
                        ],
                      ),
                    ),
                  );
                }),
                itemCount: datelist.length,
              ),
            )
          ],
        ),
      )),
    );
  }
}
