import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'ACCOUNTS',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
