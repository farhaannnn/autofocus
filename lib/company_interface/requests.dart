import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Requestscreen extends StatelessWidget {
  const Requestscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Pending requests',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
