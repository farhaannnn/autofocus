import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Historyscreen extends StatelessWidget {
  const Historyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'HISTORY',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
