import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {

  static final _firebaseAuth = FirebaseAuth.instance;
  static Future<String> signup(
      {required String email, required String password,required String name}) async {
    String res = "Something went wrong";
    try {
      UserCredential _cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
         await FirebaseFirestore.instance.collection('users').doc(_cred.user?.uid).set({'name':name});
         
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static Future<String> login(
      {required String email, required String password}) async {
    String res = 'Something went wrong';
    try {
      UserCredential _cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

