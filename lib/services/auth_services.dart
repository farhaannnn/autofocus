import 'package:auto_focus/company_interface/details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_focus/models/user_model.dart' as model;
import 'package:get/get.dart';

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final firestore = FirebaseFirestore.instance;
  static final ROLES = ['USER', 'PARTNER'];

  static Future<String> signup(
      {required String email,
      required String password,
      required String name,
      required int value,
      String? mobile,
      String? address,
      List<String>? cars,
      List<String>? servicetype,
      List<String>? date,
      List<String>? time,
      String? role,
      String? companyname,
      List<String>? services}) async {
    String res = "Something went wrong";

    try {
      // ignore: no_leading_underscores_for_local_identifiers
      UserCredential _cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      model.User user = model.User(
          email: email,   
          address: address,
          name: name,
          mobile: mobile,
          uid: _cred.user?.uid,
          cars: [],
          role: role);
      model.Partner partner = model.Partner(
          name: name,
          address: address,
          email: email,
          mobile: mobile,
          companyname: companyname,
          role: role,
          services: services,
          uid: FirebaseAuth.instance.currentUser!.uid);
      if (value == 1) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_cred.user?.uid)
            .set(user.toJson());
      } else if (value == 0) {
        await FirebaseFirestore.instance
            .collection('partners')
            .doc(_cred.user?.uid)
            .set(partner.toJson());
            
      }

      //     {
      //   'name': name,
      //   'uid': _firebaseAuth.currentUser!.uid,
      //   'email': email,
      //   'mobile':mobile,
      //   'address':address
      // }

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
      // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
      UserCredential _cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final role = await getrole();

      res = role;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static getrole() async {
    String res = "something went wrong";
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      final data = await firestore.collection('partners').doc(uid).get();
      final data1=await firestore.collection('users').doc(uid).get();
      if (data.data() != null) {
        res = data.data()!['role'];
      }
      else{
        res=data1.data()!['role'];
      }
    } catch (e) {
      res = e.toString();
      print(res);
    }
    return res;
  }
}
