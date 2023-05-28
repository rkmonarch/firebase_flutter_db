import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_db/widgets/resource/ui_helper.dart';

import '../models/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
    required String? username,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password!);

        UserModel userModel = UserModel(
          email: email,
          name: name,
          uid: user.user?.uid,
          username: username,
        
        );

        await _firestore.collection('users').doc(user.user?.uid).set(
              userModel.toJson(),
            );
        result = 'success';
      }
    } catch (err) {
       lg.wtf(err);
      //  showErrorMessage(message: "xcms");
      result = err.toString();
    }
    return result;
  }

  Future<UserCredential> logInUser({
    required String email,
    required String password,
  }) async {
    UserCredential? result;
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password).then((value) {
              result = value;
            });
       
      }
    } catch (err) {
      lg.wtf(err);
      // showErrorMessage(message: err.toString());
    }
    return result!;
  }
}