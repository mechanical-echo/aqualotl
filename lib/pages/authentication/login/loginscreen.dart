// ignore_for_file: prefer_const_constructors

import 'package:aqualotl/constants/sizes.dart';
import 'package:aqualotl/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import 'FormHeaderWidget.dart';
import 'loginFooterWidget.dart';
import 'loginscreen_loginform.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: splash,
                  title: LoginTitle,
                  subtitle: LoginSub,
                ),
                LoginForm(),
                LoginFooterWidget(size: size),
              ],
            ),
          ),
        )
      );
   
  }

}

