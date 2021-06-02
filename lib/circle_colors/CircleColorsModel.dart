import 'dart:math';

import 'package:flutter/animation.dart';

class CircleColorsModel {
  static late AnimationController circleColorsController;

  static Animation<double> rotateAnimation({
    required double begin,
  }) {
    Tween<double> rotateTween = Tween(begin: 0.0, end: 2 * pi);

    Animation<double> rotateAnimation = rotateTween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(begin, 1.0, curve: Curves.easeInOut),
      ),
    );

    return rotateAnimation;
  }

  static Animation<double> whiteCircleAnimation = rotateAnimation(
    begin: 0.4,
  );

  static Animation<double> blueCircleAnimation = rotateAnimation(
    begin: 0.3,
  );

  static Animation<double> yellowCircleAnimation = rotateAnimation(
    begin: 0.2,
  );

  static Animation<double> orangeCircleAnimation = rotateAnimation(
    begin: 0.1,
  );

  static Animation<double> pinkCircleAnimation = rotateAnimation(
    begin: 0.0,
  );
}
