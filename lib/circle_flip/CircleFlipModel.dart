import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleFlipModel {
  static late AnimationController circleFlipController;

  static Animation<double> opacityAnimation({
    required double beginOpacity,
    required double endOpacity,
  }) {
    Tween<double> opacityTween = Tween(begin: beginOpacity, end: endOpacity);

    Animation<double> opacityAnimation = opacityTween.animate(
      CurvedAnimation(
        parent: circleFlipController,
        curve: Interval(0.5, 0.5, curve: Curves.linear),
      ),
    );

    return opacityAnimation;
  }

  static Animation<Offset> offsetAnimation({
    required double beginOffsetX,
    required double endOffsetX,
    required double begin,
    required double end,
  }) {
    Tween<Offset> offsetTween =
        Tween(begin: Offset(beginOffsetX, 0.0), end: Offset(endOffsetX, 0.0));

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: circleFlipController,
        curve: Interval(begin, end, curve: Curves.linear),
      ),
    );

    return offsetAnimation;
  }

  /////// Opacity Animation
  static Animation<double> firstOpacityAnimation = opacityAnimation(
    beginOpacity: 1.0,
    endOpacity: 0.0,
  );

  static Animation<double> secondOpacityAnimation = opacityAnimation(
    beginOpacity: 0.0,
    endOpacity: 1.0,
  );

  /////// Red Circle Animation
  static Animation<Offset> firstRedAnimation = offsetAnimation(
    beginOffsetX: -25.0,
    endOffsetX: 25.0,
    begin: 0.0,
    end: 0.5,
  );

  static Animation<Offset> secondRedAnimation = offsetAnimation(
    beginOffsetX: 25.0,
    endOffsetX: -25.0,
    begin: 0.5,
    end: 1.0,
  );

  /////// Blue Circle Animation
  static Animation<Offset> firstBlueAnimation = offsetAnimation(
    beginOffsetX: 25.0,
    endOffsetX: -25.0,
    begin: 0.0,
    end: 0.5,
  );

  static Animation<Offset> secondBlueAnimation = offsetAnimation(
    beginOffsetX: -25.0,
    endOffsetX: 25.0,
    begin: 0.5,
    end: 1.0,
  );
}
