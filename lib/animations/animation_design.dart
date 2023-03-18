// ignore_for_file: camel_case_types

import 'package:aqualotl/animations/fadein_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fadein_animation_controller.dart';
class tFadeInAnimation extends StatelessWidget {
  tFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.animate,
    required this.child,
  }) : super(key: key);

  final controller = Get.put(tFadeInAnimationController());
  final int durationInMs;
  final tAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
        top:   controller.animate.value ? animate!.topAfter    : animate!.topBefore,
        left:  controller.animate.value ? animate!.leftAfter   : animate!.leftBefore,
        bottom:controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,
        right: controller.animate.value ? animate!.rightAfter  : animate!.rightBefore,
        duration:  Duration(milliseconds: durationInMs),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
          ),
        )
      );
  }
}