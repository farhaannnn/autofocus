import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {



  fetchdata()
  {
    const Text('BOOKINGS',style: TextStyle(color: Colors.white),);
    return StreamBuilder<DocumentSnapshot>(
      stream:  FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
         if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
             if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Text('No data');
            }
            final documents = snapshot.data!;
            final list1=documents['date'] as List<dynamic>;
            final list2=documents['time'] as List<dynamic>;
            return ListView.builder( itemCount: list1.length,itemBuilder: (context,index){
              final item1=list1[index];
              final item2=list2[index];
             
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: Colors.red[50],  border: Border.all(color: Colors.white,width: 2)),
                          width: double.infinity,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text( "Date : "+item1.toString(),textAlign: TextAlign.left,  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("Time : "+item2.toString(),textAlign: TextAlign.left,style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),),
              );
            });
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    //fetchdata();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.black,
       body:fetchdata() //SafeArea(child: Padding(
      //   padding: const EdgeInsets.all(25),
      //   child: Text('Bookings',style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
      // )),
    );
  }
}