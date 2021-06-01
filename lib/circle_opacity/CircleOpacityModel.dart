import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleOpacityModel {
  static late AnimationController circleOpacityController;
  static late AnimationController circleRotationController;
  static late Animation<double> rotationAnimation;

  static late Animation<double> opacityAnimation;
  static Tween<double> tweenOpacity = Tween(begin: 1.0, end: 0.0);

  static late Animation<Offset> plusOffsetAnimation;
  static late Animation<Offset> minusOffsetAnimation;

  static Tween<Offset> plusOffsetTween =
      Tween(begin: Offset(0.0, 0.0), end: Offset(55.0, 0.0));
  static Tween<Offset> minusOffsetTween =
      Tween(begin: Offset(0.0, 0.0), end: Offset(-55.0, 0.0));
}
