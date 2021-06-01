import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleFlipModel {
  static late AnimationController circleFlipController;

  static late Animation<double> firstOpacityAnimation;
  static late Animation<double> secondOpacityAnimation;
  static Tween<double> firstTweenOpacity = Tween(begin: 1.0, end: 0.0);
  static Tween<double> secondTweenOpacity = Tween(begin: 0.0, end: 1.0);

  /////// Red Circle
  static late Animation<Offset> firstRedOffsetAnimation;
  static late Animation<Offset> secondRedOffsetAnimation;
  static Tween<Offset> firstTweenRed =
      Tween(begin: Offset(-25.0, 0.0), end: Offset(25.0, 0.0));

  static Tween<Offset> secondTweenRed =
      Tween(begin: Offset(25.0, 0.0), end: Offset(-25.0, 0.0));

  /////// Blue Circle
  static late Animation<Offset> firstBlueOffsetAnimation;
  static late Animation<Offset> secondBlueOffsetAnimation;
  static Tween<Offset> firstTweenBlue =
      Tween(begin: Offset(25.0, 0.0), end: Offset(-25.0, 0.0));
  static Tween<Offset> secondTweenBlue =
      Tween(begin: Offset(-25.0, 0.0), end: Offset(25.0, 0.0));
}
