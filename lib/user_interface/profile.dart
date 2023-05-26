import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/user_model.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final _mobilecon = TextEditingController();
  final _addresscon = TextEditingController();
  var _emailcon = TextEditingController();
  var _namecon = TextEditingController();
  
  bool _enabled = false;
  bool btn = false;
  String _txt = "Edit Profile";
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getname();
  }


  getname() async {

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      _emailcon.text = (snap.data() as Map<String, dynamic>)['email'];
      _namecon.text = (snap.data() as Map<String, dynamic>)['name'];
      _addresscon.text = (snap.data() as Map<String, dynamic>)['address'];
      _mobilecon.text = (snap.data() as Map<String, dynamic>)['mobile'];
    });
  }

  storedetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'address': _addresscon.text,
      'mobile': _mobilecon.text,
      'email': _emailcon.text,
      'name': _namecon.text
    });
  }

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
                  controller: _namecon,
                  enabled: _enabled,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
              //const SizedBox(
              //  height: 40,
              // ),
              const Divider(
                height: 40,
                color: Colors.white,
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  controller: _emailcon,
                  enabled: _enabled,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
              //const SizedBox(
              //  height: 40,
              // ),
              const Divider(
                height: 40,
                color: Colors.white,
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: _enabled,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  controller: _mobilecon,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
              //const SizedBox(
              // height: 40,
              //),
              const Divider(
                height: 40,
                color: Colors.white,
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: TextFormField(
                  enabled: _enabled,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  controller: _addresscon,
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                height: 60,
              ),
              Container(
                  color: Colors.black,
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          _enabled = !_enabled;
                          btn = !btn;
                          if (btn) {
                            _txt = "Update Profile";
                          } else {
                            storedetails();
                            _txt = "Edit Profile";
                          }
                        });
                      },
                      child: Text(
                        _txt,
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
