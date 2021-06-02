import 'package:flutter/animation.dart';

class CapsuleSpacingModel {
  static late AnimationController capsuleSpacingController;

  static Animation<double> spacingAnimation =
      Tween(begin: 5.0, end: 15.0).animate(
    CurvedAnimation(parent: capsuleSpacingController, curve: Curves.easeInOut),
  );
}
