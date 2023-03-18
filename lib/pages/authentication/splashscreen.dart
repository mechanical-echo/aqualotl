// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, must_call_super, prefer_const_constructors_in_immutables

import 'package:aqualotl/animations/fadein_animation_controller.dart';
import 'package:aqualotl/constants/image_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animations/animation_design.dart';
import '../../animations/fadein_animation_model.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    final controller = Get.put(tFadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          //text animated
          tFadeInAnimation(
            durationInMs: 2000, 
            animate: tAnimatePosition(
              topBefore: 50, topAfter: 50, leftBefore: -80, leftAfter: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aqualotl', style: Theme.of(context).textTheme.displayLarge),
                Text('Stay hydrated!', style: Theme.of(context).textTheme.displayMedium),
            ],)
          ),
          //image animated
          tFadeInAnimation(
            durationInMs: 1600, 
            animate: tAnimatePosition(leftAfter: 50, leftBefore: 50, bottomAfter: 350, bottomBefore: 0), 
            child: Image(image: const AssetImage(splash), height: height * 0.25),
          )
        ],
      )
    );
  }
  

}

