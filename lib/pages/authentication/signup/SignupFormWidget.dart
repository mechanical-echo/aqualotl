// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Full Name"),
                    prefixIcon: Icon(Icons.person_outline_outlined,
                        color: lSubTextColor),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: lSubTextColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: lSubTextColor))),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Email"),
                    prefixIcon:
                        Icon(Icons.email_outlined, color: lSubTextColor),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: lSubTextColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: lSubTextColor))),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Password"),
                    prefixIcon:
                        Icon(Icons.fingerprint_sharp, color: lSubTextColor),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: lSubTextColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: lSubTextColor))),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Signup".toUpperCase()),
                ),
              )
            ],
          ),
        ));
  }
}
