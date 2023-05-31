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
  fetchdetails()
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
  List items = ['ac-service', 'oil-service', 'wheel-alignment', 'car-wash'];

//    fetchdetails()
//   {print('hello');
// StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('ac_service')
//       .snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     }

//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     }

//     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//       return Text('No data available');
//     }
// print('hello');
//     return ListView.builder(
//       itemCount: snapshot.data!.docs.length,
//       itemBuilder: (BuildContext context, int index) {
//         DocumentSnapshot document = snapshot.data!.docs[index];
//         Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//         String value = data['status'];
//         print(value) ;// Replace 'value' with the actual field name in your document
//         return ListTile(title: Text(value));
//       },
//     );
//   },
// );
//   }

  @override
  void initState() {
    // TODO: implement initState
    //fetchdata();
    super.initState();
    valuechoose = items[0];
    //fetchdetails();
  }

  // fetchdetails(int id) async {
  //   print(id);

  //   if (id == 1) {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('ac_service')
  //         .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       print('hello');
  //       List<DocumentSnapshot> documents = querySnapshot.docs;
  //       //print(documents[0]);

  //       return ListView.builder(
  //         itemCount: documents.length,
  //         itemBuilder: (context, index) {
  //           DocumentSnapshot document = documents[index];
  //           Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //           String status = data['status'];
  //           String date=document.id.substring(0,10);
  //           String time=document.id.substring(11);
  //            return Padding(
  //               padding: const EdgeInsets.all(20),
  //               child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: Colors.red[50],  border: Border.all(color: Colors.white,width: 2)),
  //                         width: double.infinity,
  //                         height: 100,
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(top: 20),
  //                           child: Column(
  //                             children: [
  //                               Text( "Date : $date",textAlign: TextAlign.left,  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
  //                               Text("Time : $time",textAlign: TextAlign.left,style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
  //                             Text("Status : $status",textAlign: TextAlign.left,style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),)],
  //                           ),
  //                         ),),
  //             );
  //         },
  //       );
  //     }
  //     else {
  //       return Container(child: Text('No bookings currently'));
  //     }
  //   }
  // }
// Future<List<Widget>> fetchdetails(int id) async {
//   print(id);

//   if (id == 1) {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('ac_service')
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       print('hello');
//       List<DocumentSnapshot> documents = querySnapshot.docs;
//       List<Widget> bookingWidgets = [];

//       for (var document in documents) {
//         Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//         String status = data['status'];
//         String date = document.id.substring(0, 10);
//         String time = document.id.substring(11);

//         Widget bookingWidget = Padding(
//           padding: const EdgeInsets.all(20),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//               border: Border.all(color: Colors.white, width: 2),
//             ),
//             width: double.infinity,
//             height: 100,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Column(
//                 children: [
//                   Text(
//                     "Date : $date",
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.raleway(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Time : $time",
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.raleway(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Status : $status",
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.raleway(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );

//         bookingWidgets.add(bookingWidget);
//       }

//       return bookingWidgets;
//     } else {
//       return [Container(child: Text('No bookings currently'))];
//     }
//   }

//   return []; // Return an empty list if the condition is not met
// }
  String? valuechoose;

  // fetchdetails() async {
  //   print('hello');
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('ac_service')
  //       .get();
  //       final List<DocumentSnapshot> list1=querySnapshot.docs;
  //       print(list1.length);
  //       for(var document in list1)
  //       {
  //         String date=document.id.substring(0,10);
  //         String time=document.id.substring(11);
  //         //Map<String,dynamic> data=document.data as Map<String,dynamic>;
  //         print(date);
  //         print(time);
  //         //print(data['status']);
  //         Container(height: 100,width: double.infinity, color: Colors.white,  child: Column(children: [Text(date),Text(time)],),);
  //       }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 180,
            child: Column(
              children: [
                Text(
                  'Select Service',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      value: valuechoose,
                      onTap: () {},
                      items: items
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          valuechoose = value as String;
                        });
                        if (valuechoose == 'ac-service') {
                          fetchdetails();
                        } else if (valuechoose == 'oil-service') {
                          fetchdetails();
                        } else if (valuechoose == 'wheel-alignment') {
                          fetchdetails();
                        } else if (valuechoose == 'car-wash') {
                          fetchdetails();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
