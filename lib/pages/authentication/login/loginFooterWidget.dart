// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../auth_service.dart';
import '../signup/signupPage.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
                image: AssetImage(GoogleLogo), height: size.height * 0.05),
            onPressed: () {
              AuthService().signInWithGoogle();
              Navigator.pop(context);
            },
            label: Text("Sign In with Google"),
            style: Theme.of(context).outlinedButtonTheme.style,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Get.to(SignupPage()),
          child: Text.rich(TextSpan(
              text: "Don't have an Account? ",
              style: Theme.of(context).textTheme.bodySmall,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextSpan(
                  text: "Signup",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ])),
        ),
      ],
    );
  }
}
