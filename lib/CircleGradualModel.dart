import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleGradualModel {
  static late AnimationController circleGradualcontroller;

  static late Animation<Offset> firstCircleAnimation;
  static late Animation<Offset> secondCircleAnimation;
  static late Animation<Offset> thirdCircleAnimation;
  static late Animation<Offset> fourthCircleAnimation;
  static late Animation<Offset> fifthCircleAnimation;
  static late Animation<Offset> sixthCircleAnimation;
  static late Animation<Offset> seventhCircleAnimation;
  static late Animation<Offset> eighthCircleAnimation;

  static Tween<Offset> plusOffsetTween =
      Tween(begin: Offset(55.0, 0.0), end: Offset(0.0, 0.0));
  static Tween<Offset> minusOffsetTween =
      Tween(begin: Offset(-55.0, 0.0), end: Offset(0.0, 0.0));
}
