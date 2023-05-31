import 'package:auto_focus/company_interface/start.dart';
import 'package:auto_focus/user_interface/aboutus.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Accountscreen1 extends StatelessWidget {
   Accountscreen1({super.key});
final FirebaseFirestore firestore = FirebaseFirestore.instance;
  showvehicles()
  {
    return ListView.builder(itemCount: 2,itemBuilder: (context, index) {
      return Container(
        color: Colors.green,
        height: 30
,        width: 10,
      );
    },);
  }

  myvehicles(context) {
    showModalBottomSheet<void>(backgroundColor: Colors.black,shape: Border.all(color: Colors.white),
      context: context,
      builder: (BuildContext context) {
         return StreamBuilder<DocumentSnapshot>(
          stream: firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('No data');
            }
              final documents = snapshot.data!;
              final list=documents['cars']as List<dynamic>;

              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) { 
                    final item = list[index];
                    // final document = documents[index];
                    // final data = document.data() as Map<String, dynamic>;
              
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),  color: Colors.grey[50],  border: Border.all(color: Colors.white,width: 2)),
                        width: double.infinity,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,left: 30),
                          child: Text(item.toString(),style: GoogleFonts.raleway(color: Colors.red, fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        
                        
                      ),
                    );
                  },
                ),
              );
            

           
          },
        );
         
        //   height: 400,
        //   color: Colors.white,
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       mainAxisSize: MainAxisSize.min,
        //       children: <Widget>[
        //          Text('My vehicles',style: GoogleFonts.raleway(fontSize: 15,fontWeight: FontWeight.w600),),
                 

        //         Row(mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             ElevatedButton(
        //                 onPressed: () {}, child: const Text('Add next vehicle'))
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Accounts',
                  style: GoogleFonts.montserrat(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const Profilescreen(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        Text('My Profile',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      myvehicles(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.car_rental,
                          color: Colors.black,
                        ),
                        Text('My Vehicles',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AboutScreen1(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                        Text('About Us',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const Startscreen(),
                              type: PageTransitionType.rightToLeftWithFade),
                          (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.work_outline_rounded,
                          color: Colors.black,
                        ),
                        Text('Register as Partner',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.square(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     PageTransition(
                      //         child: LoginScreen(),
                      //         type: PageTransitionType.leftToRight),
                      //     (route) => false);
                    },
                    child: Text(
                      'Logout',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
