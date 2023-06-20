
import 'package:auto_focus/services/auth_services.dart';
import 'package:auto_focus/user_interface/bottomnav.dart';
import 'package:auto_focus/user_interface/home.dart';
import 'package:auto_focus/user_interface/login.dart';
import 'package:auto_focus/user_interface/searchscreen.dart';
import 'package:auto_focus/user_interface/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Splashscreen(),
      // home:  StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.hasData) {
      //         return const Bottomnav();
      //       } else if (snapshot.hasError) {
      //         return const SnackBar(
      //           content: Text("Something has gone wrong."),
      //         );
      //       }
      //     } else if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator();
      //     }
      //     return  LoginScreen();
      //   })
    
    );
  }
}
