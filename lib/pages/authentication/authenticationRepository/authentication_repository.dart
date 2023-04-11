import 'package:aqualotl/pages/HomePage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcomescreen.dart';
import 'exceptions/signup-email-password-failure.dart';

class AuthenticationRepository extends GetxController {
  AuthenticationRepository(this._firebaseUser);

  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  @override
  void onReady() {
    _firebaseUser = (_auth.currentUser) as Rx<User?>;
    _firebaseUser.bindStream(_auth.userChanges());
    ever(
      _firebaseUser,
      _setInitialScreen,
    );
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => HomePage());
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(_firebaseUser!.value);
      _firebaseUser!.value != null
          ? Get.offAll(() => HomePage())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
