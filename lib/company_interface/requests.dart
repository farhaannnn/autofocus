import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Requestscreen extends StatelessWidget {
  Requestscreen({super.key});
  var grey = 0xFF9D9D9D;
  var yellow = 0xFFFED604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
                  children: [const SizedBox(height: 20,),
            Center(
              child: Text(
                'Pending requests',
                style: GoogleFonts.montserrat(
                    color: Color(yellow),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
