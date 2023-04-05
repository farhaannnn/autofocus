import 'package:auto_focus/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

class Homescreen extends StatefulWidget {

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex=0;

  void _ontapped(int index)
  {
    setState(() 
    {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [    ElevatedButton(onPressed: ()
      {
        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.leftToRightWithFade,
        child: const LoginScreen()), (route) => false);
      }, child: const Text('LOGOUT'))],)),
      
      
      
      
      
      
      
      
      
      
      
      
      
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile'),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings')],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.indigo,
      onTap: _ontapped,

     ),
      
    );
  }
  
}