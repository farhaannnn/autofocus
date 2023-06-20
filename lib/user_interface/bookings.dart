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
  // fetchdetails()
  // {
  //   const Text('BOOKINGS',style: TextStyle(color: Colors.white),);
  //   return StreamBuilder<DocumentSnapshot>(
  //     stream:  FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
  //        if (snapshot.hasError) {
  //             return Text('Error: ${snapshot.error}');
  //           }
  //            if (snapshot.connectionState == ConnectionState.waiting) {
  //             return const CircularProgressIndicator();
  //           }
  //           if (!snapshot.hasData || !snapshot.data!.exists) {
  //             return const Text('No data');
  //           }
  //           final documents = snapshot.data!;
  //           final list1=documents['date'] as List<dynamic>;
  //           final list2=documents['time'] as List<dynamic>;
  //           return ListView.builder( itemCount: list1.length,itemBuilder: (context,index){
  //             final item1=list1[index];
  //             final item2=list2[index];

  //             return Padding(
  //               padding: const EdgeInsets.all(20),
  //               child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: Colors.red[50],  border: Border.all(color: Colors.white,width: 2)),
  //                         width: double.infinity,
  //                         height: 100,
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(top: 20),
  //                           child: Column(
  //                             children: [
  //                               Text( "Date : "+item1.toString(),textAlign: TextAlign.left,  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
  //                               Text("Time : "+item2.toString(),textAlign: TextAlign.left,style: GoogleFonts.raleway(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),)
  //                             ],
  //                           ),
  //                         ),),
  //             );
  //           });
  //     },
  //   );
  // }
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
    fetchdetails(1);
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
  String? date, time;
  List<String> l1 = [];
  List<String> l2 = [];
  List<String> l3 = [];
  fetchdetails(int id) async {
    String collection = 'ac_service';
    l1.clear();
    l2.clear();
    l3.clear();
    print('hello');
    if (id == 1) {
      collection = 'ac_service';
    } else if (id == 2) {
      collection = 'oil_service';
    } else if (id == 3) {
      collection = 'wheel_service';
    } else if (id == 4) {
      collection = 'wash_service';
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(collection)
        .get();
    final List<DocumentSnapshot> list1 = querySnapshot.docs;
    for (var document in list1) {
      setState(() {
        date = document.id.substring(0, 10);
        time = document.id.substring(11);
        l1.add(date!);
        l2.add(time!);
        l3.add((document.data() as Map<String, dynamic>)['status']);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
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
                // width: 160,
                // height: 60,
                child: DropdownButtonFormField(
                  style: GoogleFonts.raleway(fontWeight: FontWeight.w600,color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
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
                        fetchdetails(1);
                      } else if (valuechoose == 'oil-service') {
                        fetchdetails(2);
                      } else if (valuechoose == 'wheel-alignment') {
                        fetchdetails(3);
                      } else if (valuechoose == 'car-wash') {
                        fetchdetails(4);
                      }
                    }),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white,
                          ),
                          // height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.car_repair_rounded,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        '${l3[index]}',
                                        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Date: ${l1[index]}',
                                      style:GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('Time: ${l2[index]}',style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                                  ),
                                  const Divider(
                                    height: 20,
                                    thickness: 0.7,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              if (l3[index] == 'pending')
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.hourglass_bottom_rounded),
                                )
                              else if (l3[index] == 'Accepted')
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.check_sharp),
                                )
                              else if (l3[index] == 'Completed')
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.green,
                                    ),
                                ),
                            ],
                          ),
                        ));
                  }),
                  itemCount: l1.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
