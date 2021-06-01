import 'package:flutter/animation.dart';

class CapsuleSpacingModel {
  static late AnimationController capsuleSpacingController;
  static late Animation<double> spacingAnimation;
  static Tween<double> tweenSpacing = Tween(begin: 5.0, end: 15.0);
}
