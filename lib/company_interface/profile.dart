import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  static const grey = 0xFF9D9D9D;
  static const yellow = 0xFFFED604;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
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
                    onPressed: () {},
                    child: Text(
                      'Update Profile',
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      )),
    );
  }
}
