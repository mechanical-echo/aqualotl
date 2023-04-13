// ignore_for_file: use_build_context_synchronously

import 'package:aqualotl/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final cemail = TextEditingController();
  final cpassw = TextEditingController();
  bool _visible = true;

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: cemail.text, password: cpassw.text);

      Navigator.pop(context);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String text = "Unknown error, please contact developers!";
      switch (e.code) {
        case 'user-not-found':
          text =
              "User not found :(\nMaybe there is an error in email or You haven't signed up yet.";
          break;
        case 'wrong-password':
          text =
              "Wrong password! :(\nCheck for mistakes in your password, otherwise, try clicking 'Forgot password'.";
          break;
        case 'invalid-email':
          text =
              "Invalid email :(\nLooks like email isn't correct. Probably some error with or after '@' ";
          break;
        default:
          text = e.code;
      }

      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: 160,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        style: Theme.of(context).textButtonTheme.style,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Understood."),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            controller: cemail,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
                focusColor: lSubTextColor,
                fillColor: lSubTextColor,
                labelStyle: TextStyle(color: lSubTextColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: lSubTextColor))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: _visible,
            controller: cpassw,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.fingerprint_sharp),
              labelText: "Password",
              hintText: "Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                icon: _visible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              labelStyle: const TextStyle(color: lSubTextColor),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: lSubTextColor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Get.to(HomePage());
                signUserIn();
                // Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(signup.toUpperCase()),
            ),
          ),
        ]),
      ),
    );
  }
}

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lBgColor,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.mail_outline_rounded,
              size: 60,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  "Reset via Email",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
