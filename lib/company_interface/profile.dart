import 'package:auto_focus/company_interface/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

bool state = false;
bool btn = false;
String txt = "Edit Profile";
final _namecontroller = TextEditingController();
final _addresscontroller = TextEditingController();
final _orgnamecontroller = TextEditingController();
final _emailcontroller = TextEditingController();
final _mobilecontroller = TextEditingController();

updateprof() async {
  await FirebaseFirestore.instance
      .collection('partners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'address': _addresscontroller.text,
    'email': _emailcontroller.text,
    'companyname': _orgnamecontroller.text,
    'mobile': _mobilecontroller.text,
    'name': _namecontroller.text,
  });
}

getinfo() async {
  DocumentSnapshot snap = await FirebaseFirestore.instance
      .collection('partners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  _namecontroller.text = (snap.data() as Map<String, dynamic>)['name'];
  _emailcontroller.text = (snap.data() as Map<String, dynamic>)['email'];
  _orgnamecontroller.text =
      (snap.data() as Map<String, dynamic>)['companyname'];
  _mobilecontroller.text = (snap.data() as Map<String, dynamic>)['mobile'];
  _addresscontroller.text = (snap.data() as Map<String, dynamic>)['address'];
}

class _ProfilescreenState extends State<Profilescreen> {
  static const grey = 0xFF9D9D9D;
  static const yellow = 0xFFFED604;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinfo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Profile',
                  style: GoogleFonts.montserrat(
                      color: const Color(yellow),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: state,
                  style: const TextStyle(color: Colors.white),
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.perm_identity),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Name',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: state,
                  style: const TextStyle(color: Colors.white),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Email',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: state,
                  style: const TextStyle(color: Colors.white),
                  controller: _orgnamecontroller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.apartment),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Organization Name',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                    inputFormatters: [
            LengthLimitingTextInputFormatter(10),
      ],
                  style: const TextStyle(color: Colors.white),
                  enabled: state,
                  controller: _mobilecontroller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.call),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Mobile',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: state,
                  style: const TextStyle(color: Colors.white),
                  controller: _addresscontroller,
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.maps_home_work),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Address',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                  color: Colors.black,
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(yellow),
                      ),
                      onPressed: () {
                    
                          setState(() {
                            state = !state;
                            btn = !btn;
                            if (btn) {
                              txt = "Update Profile";
                            } else {
                              updateprof();
                              txt = "Edit Profile";
                            }
                          });
                        }
                      ,
                      child: Text(
                        txt,
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                  )),
                  
            ],
          ),
        ),
      )),
    );
  }
}
