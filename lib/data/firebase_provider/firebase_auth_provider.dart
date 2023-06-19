import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import 'package:fleeque/data/models/user_model.dart';

class FirebaseAuthProvider {
  static final fb_auth.FirebaseAuth _firebaseAuth =
      fb_auth.FirebaseAuth.instance;

  Future<UserMapper> signUpUser(
      {required String email, required String password}) async {
    try {
      fb_auth.UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final userFb = result.user!;
      return UserMapper.fromFirebaseUser(userFb);
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists during sign-up');
      } else {
        throw Exception('An error occured during sign-up');
      }
    }
  }

  Future<UserMapper> signInUser(
      {required String email, required String password}) async {
    try {
      fb_auth.UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final userFb = result.user!;
      return UserMapper.fromFirebaseUser(userFb);
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw Exception('Invalid email or password.');
      } else {
        // print(e.message);
        throw Exception('An error occurred during sign-in.');
      }
    }
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
