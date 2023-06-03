import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Testscreen extends StatefulWidget {
  Testscreen({super.key});

  @override
  State<Testscreen> createState() => _TestscreenState();
}

class _TestscreenState extends State<Testscreen> {
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
                'Pending requests thee',
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
                .doc(FirebaseAuth.instance.currentUser!.uid).collection('booking_data')
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
                  return InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => StudentDetail(
                      //       uidstudent: (snapshot.data! as dynamic).docs[index]
                      //           ['uid'],
                      //     ),
                      //   ),
                      // );
                      // setState(() {
                      //   studentid =
                      //       (snapshot.data! as dynamic).docs[index]['uid'];
                      //   print(studentid);
                      // });
                    },
                    child: Container(color: Colors.white,
                      child: Row(
                        children: [
                          Text(
                            (snapshot.data! as dynamic).docs[index]['user-name'],
                          ),
                          const Text('   '),
                          Text(
                            (snapshot.data! as dynamic).docs[index]['booked-date'],
                          ),
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
