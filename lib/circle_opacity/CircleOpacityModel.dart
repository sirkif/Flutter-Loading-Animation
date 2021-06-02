import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleOpacityModel {
  static late AnimationController circleOpacityController;
  static late AnimationController circleRotationController;

  static Animation<double> opacityAnimation =
      Tween(begin: 1.0, end: 0.0).animate(
    circleOpacityController,
  );

  static Animation<double> rotationAnimation = CurvedAnimation(
    parent: circleRotationController,
    curve: Curves.linear,
  );

  static Animation<Offset> offsetAnimation({
    required double endOffsetX,
  }) {
    Tween<Offset> offsetTween =
        Tween(begin: Offset(0.0, 0.0), end: Offset(endOffsetX, 0.0));

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(parent: circleOpacityController, curve: Curves.linear),
    );

    return offsetAnimation;
  }

  static Animation<Offset> plusOffsetAnimation = offsetAnimation(
    endOffsetX: 55.0,
  );

  static Animation<Offset> minusOffsetAnimation = offsetAnimation(
    endOffsetX: -55.0,
  );
}
