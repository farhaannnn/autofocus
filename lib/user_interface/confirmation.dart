import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  bool _ispressed=false;
  bool _ispressed1=false;
  bool _ispressed2=false;
  bool _ispressed3=false;
  DateTime _date = DateTime.now();
  void datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(3000))
        .then((value) {
      setState(() {
        _date = value!;
      });
    });
  }

  String _currtext = 'Choose your date';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 19),
                
              //LOCATION FOR PICKUP CONTAINER
              Container(
                height: 60,
                width: 500,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 238, 224, 224),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      "Location for PickUp.",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
                
                
              const SizedBox(height: 30),
                
              // DATE PICKER
              Text(
                "Select your preferred date and time.",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  datepicker();
                  setState(() {
                    _currtext = _date.toString();
                  });
                },
                color: Colors.red,
                child: Text(_currtext,style: TextStyle(color: Colors.white),),
              ),
                
                
              const SizedBox(
                height: 23,),
                
                
                //PICK TIME SLOT
              Text(
                "Pick Time Slot",
                style: GoogleFonts.raleway(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
                    style: GoogleFonts.raleway(color: Colors.white,
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {setState(() {
                      _ispressed=!_ispressed;
                    });

                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: _ispressed?Colors.red:Colors.white,  minimumSize: const Size(130, 40)),
                    child: Text(
                      "10-11AM",
                      style: GoogleFonts.montserrat(color: Colors.black,
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _ispressed1=!_ispressed1;
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: _ispressed1?Colors.red:Colors.white,
                      minimumSize: const Size(130, 40),
                    ),
                    child: Text(
                      "11-12PM",
                      style: GoogleFonts.montserrat(color: Colors.black,
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  )
                ],
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
                    style: GoogleFonts.raleway(color: Colors.white,
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _ispressed2=!_ispressed2;
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: _ispressed2?Colors.red:Colors.white, minimumSize: const Size(130, 40)),
                    child: Text(
                      "2-3PM",
                      style: GoogleFonts.montserrat(color: Colors.black,
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _ispressed3=!_ispressed3;
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: _ispressed3?Colors.red:Colors.white,
                      minimumSize: const Size(130, 40),
                    ),
                    child: Text(
                      "3-4PM",
                      style: GoogleFonts.montserrat(color: Colors.black,
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  )
                ],
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
                  child:
                      ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(33),
                        //minimumSize: Size(50,40),
                        
                      ), child:  Text("Book now",style: GoogleFonts.raleway(fontSize: 15,fontWeight: FontWeight.bold),),))
            ]),
          ),
        ),
      ),
    );
  }
}
