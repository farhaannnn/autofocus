import 'package:auto_focus/user_interface/account.dart';
import 'package:auto_focus/user_interface/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'bookings.dart';


class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedIndex = 0;
  final _screens1 = [
    const Homescreen(),
    const Bookingscreen(),
     Accountscreen1()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens1[_selectedIndex],
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          onTap: _ontapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.handshake), label: 'BOOKINGS'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ACCOUNT')
          ]),
    );
  }

  void _ontapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
