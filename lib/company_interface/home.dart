import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../test.dart';
import '../user_interface/home.dart';
import 'account.dart';
import 'history.dart';
import 'requests.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});
  static const grey = 0xFF9D9D9D;
  static const yellow = 0xFFFED604;

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  int _selectedIndex = 0;
  final _screens = [Requestscreen(), Historyscreen(), Accountscreen()];
  void _ontapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(Homescreen1.yellow),
          unselectedItemColor: const Color(Homescreen1.grey),
          onTap: _ontapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'HISTORY'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ACCOUNT')
          ]),
    );
  }
}
