// ignore_for_file: prefer_const_constructors

import 'package:aqualotl/constants/colors.dart';
import 'package:aqualotl/pages/forgot%20password/OTP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final cemail = TextEditingController();
  final cpassw = TextEditingController();
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    void signUserIn() async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: cemail.text, password: cpassw.text);
        print("AFTER LOGIN AFTER LOGIN AFTER LOGIN");
        Navigator.pop(context);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        print("ERROR ERROR ERROR ERROR ERROR\n ${e.code}");
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
        print(text);

        showDialog(
          context: context,
          builder: (context) {
            print("i am inside");
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
                          child: Text("Understood."),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
        print("done");
      }
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            controller: cemail,
            decoration: InputDecoration(
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
          SizedBox(height: 30),
          TextFormField(
            obscureText: _visible,
            controller: cpassw,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint_sharp),
              labelText: "Password",
              hintText: "Password",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                icon: _visible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              labelStyle: TextStyle(color: lSubTextColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: lSubTextColor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  builder: (context) => Container(
                    height: height * 0.7,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text("Forgot your password?", style: Theme.of(context).textTheme.displayLarge,),

                          Text(
                            "Forgot? No worries! You can restore access to your account easily using email",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  label: Text("Email"),
                                  hintText: "Email",
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(OTP());
                                  },
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text("Next step"),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Image(
                                image: AssetImage(splash),
                                width: width * 0.5,
                              )
                            ],
                          ))
                        ]),
                  ),
                );
              },
              child: Text("Forgot password"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print("BEFORE LOGIN BEFORE LOGIN BEFORE LOGIN");
                signUserIn();
                // Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(login.toUpperCase()),
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
            SizedBox(
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
