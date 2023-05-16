import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_focus/models/user_model.dart' as model;

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;
  static Future<String> signup(
      {required String email,
      required String password,
      required String name,
      String? mobile,
      String? address,
      List<String>? cars}) async {
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
          cars: []);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_cred.user?.uid)
          .set(user.toJson());

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
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
