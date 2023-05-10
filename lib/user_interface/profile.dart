import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final _mobilecon=TextEditingController();
  final _addresscon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                '  My Profile',
                style: GoogleFonts.montserrat(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.perm_identity),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Name',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Email',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(controller: _mobilecon,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      prefixIconColor: Colors.white,
                      label: Text(
                        'Mobile no',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(controller: _addresscon,
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
                            fontWeight: FontWeight.w400),
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
                        backgroundColor: Colors.red,
                      ),
                      onPressed: (){final FirebaseAuth auth = FirebaseAuth.instance;

void inputData() {
  final User? user = auth.currentUser;
  final uid = user!.uid;
  print(uid);
  // here you write the codes to input the data into firestore
}},
                      child: Text(
                        'Update Profile',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
