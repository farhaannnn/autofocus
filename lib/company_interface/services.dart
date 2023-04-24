import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Servicescreen extends StatefulWidget {
  const Servicescreen({super.key});

  @override
  State<Servicescreen> createState() => _ServicescreenState();
}

class _ServicescreenState extends State<Servicescreen> {
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
            child: Center(
                child: Text(
          'Services',
          style: GoogleFonts.montserrat(
              color: Color(yellow), fontSize: 25, fontWeight: FontWeight.bold),
        ))),
      ),
    );
  }
}
