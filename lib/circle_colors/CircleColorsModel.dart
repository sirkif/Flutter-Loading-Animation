import 'dart:math';

import 'package:flutter/animation.dart';

class CircleColorsModel {
  static late AnimationController circleColorsController;
  static late Animation<double> whiteCircleAnimation;
  static late Animation<double> blueCircleAnimation;
  static late Animation<double> yellowCircleAnimation;
  static late Animation<double> orangeCircleAnimation;
  static late Animation<double> pinkCircleAnimation;
  static Tween<double> tweenRotate = Tween(begin: 0.0, end: 2 * pi);
}
