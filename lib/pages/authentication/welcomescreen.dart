// ignore_for_file: prefer_const_constructors

import 'package:aqualotl/animations/fadein_animation_controller.dart';
import 'package:aqualotl/pages/authentication/login/loginscreen.dart';
import 'package:aqualotl/pages/authentication/signup/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/strings.dart';
import '../../../../constants/sizes.dart';

import '../../animations/animation_design.dart';
import '../../animations/fadein_animation_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(tFadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          tFadeInAnimation(
            durationInMs: 1200,
            animate: tAnimatePosition(
              bottomAfter: 0, 
              bottomBefore: -100, 
              leftBefore: 0,
              leftAfter: 0,
              rightAfter: 0,
              rightBefore: 0,
              topAfter: 0,
              topBefore: 0,
              ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: const AssetImage(splash), height: height * 0.6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        welcome, 
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        welcomesub,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.left),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: Theme.of(context).outlinedButtonTheme.style,
                          onPressed: () {
                            Get.to(LoginScreen());
                            
                          },
                          child: Text(login.toUpperCase()),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () => Get.to(SignupPage()),
                          child: Text(signup.toUpperCase()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}