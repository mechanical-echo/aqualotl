import 'package:aqualotl/pages/HomePage/homepage.dart';
import 'package:aqualotl/pages/authentication/welcomescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print("GOT DATA == ${snapshot.hasData}");
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const WelcomeScreen();
        }
      },
    ));
  }
}
