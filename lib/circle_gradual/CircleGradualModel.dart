import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleGradualModel {
  static late AnimationController circleGradualcontroller;

  static Animation<Offset> offsetAnimation({
    double beginOffsetX = 55.0,
    double endOffsetX = 0.0,
    required double begin,
    required double end,
  }) {
    Tween<Offset> offsetTween =
        Tween(begin: Offset(beginOffsetX, 0.0), end: Offset(endOffsetX, 0.0));

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: circleGradualcontroller,
        curve: Interval(begin, end, curve: Curves.easeOut),
      ),
    );

    return offsetAnimation;
  }

  static Animation<double> scaleAnimation({
    double beginScale = 1.0,
    double endScale = 0.5,
    required double begin,
    required double end,
  }) {
    Tween<double> scaleTween = Tween(begin: beginScale, end: endScale);

    Animation<double> scaleAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: circleGradualcontroller,
        curve: Interval(begin, end, curve: Curves.easeOut),
      ),
    );

    return scaleAnimation;
  }

  /////// 1 Circle Animation
  static Animation<Offset> firstCircleAnimation = offsetAnimation(
    begin: 0.0,
    end: 0.0625,
  );

  static Animation<double> firstScaleAnimation = scaleAnimation(
    begin: 0.0,
    end: 0.0625,
  );

  /////// 2 Circle Animation
  static Animation<Offset> secondCircleAnimation = offsetAnimation(
    begin: 0.0625,
    end: 0.125,
  );

  static Animation<double> secondScaleAnimation = scaleAnimation(
    begin: 0.0625,
    end: 0.125,
  );

  /////// 3 Circle Animation
  static Animation<Offset> thirdCircleAnimation = offsetAnimation(
    begin: 0.125,
    end: 0.1875,
  );

  static Animation<double> thirdScaleAnimation = scaleAnimation(
    begin: 0.125,
    end: 0.1875,
  );

  /////// 4 Circle Animation
  static Animation<Offset> fourthCircleAnimation = offsetAnimation(
    begin: 0.1875,
    end: 0.25,
  );

  static Animation<double> fourthScaleAnimation = scaleAnimation(
    begin: 0.1875,
    end: 0.25,
  );

  /////// 5 Circle Animation
  static Animation<Offset> fifthCircleAnimation = offsetAnimation(
    begin: 0.25,
    end: 0.3125,
  );

  static Animation<double> fifthScaleAnimation = scaleAnimation(
    begin: 0.25,
    end: 0.3125,
  );

  /////// 6 Circle Animation
  static Animation<Offset> sixthCircleAnimation = offsetAnimation(
    beginOffsetX: -55.0,
    begin: 0.3125,
    end: 0.375,
  );

  static Animation<double> sixthScaleAnimation = scaleAnimation(
    begin: 0.3125,
    end: 0.375,
  );

  /////// 7 Circle Animation
  static Animation<Offset> seventhCircleAnimation = offsetAnimation(
    beginOffsetX: -55.0,
    begin: 0.375,
    end: 0.4375,
  );

  static Animation<double> seventhScaleAnimation = scaleAnimation(
    begin: 0.375,
    end: 0.4375,
  );

  /////// 8 Circle Animation
  static Animation<Offset> eighthCircleAnimation = offsetAnimation(
    beginOffsetX: -55.0,
    begin: 0.4375,
    end: 0.5,
  );

  static Animation<double> eighthScaleAnimation = scaleAnimation(
    begin: 0.4375,
    end: 0.5,
  );

  /////// 9 Circle Animation
  static Animation<Offset> ninthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: 55.0,
    begin: 0.5,
    end: 0.5625,
  );

  static Animation<double> ninthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.5,
    end: 0.5625,
  );

  /////// 10 Circle Animation
  static Animation<Offset> tenthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: 55.0,
    begin: 0.5625,
    end: 0.625,
  );

  static Animation<double> tenthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.5625,
    end: 0.625,
  );

  /////// 11 Circle Animation
  static Animation<Offset> eleventhCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: 55.0,
    begin: 0.625,
    end: 0.6875,
  );

  static Animation<double> eleventhScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.625,
    end: 0.6875,
  );

  /////// 12 Circle Animation
  static Animation<Offset> twelfthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: 55.0,
    begin: 0.6875,
    end: 0.75,
  );

  static Animation<double> twelfthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.6875,
    end: 0.75,
  );

  /////// 13 Circle Animation
  static Animation<Offset> thirteenthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: 55.0,
    begin: 0.75,
    end: 0.8125,
  );

  static Animation<double> thirteenthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.75,
    end: 0.8125,
  );

  /////// 14 Circle Animation
  static Animation<Offset> fourteenthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: -55.0,
    begin: 0.8125,
    end: 0.875,
  );

  static Animation<double> fourteenthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.8125,
    end: 0.875,
  );

  /////// 15 Circle Animation
  static Animation<Offset> fifteenthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: -55.0,
    begin: 0.875,
    end: 0.9375,
  );

  static Animation<double> fifteenthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.875,
    end: 0.9375,
  );

  /////// 16 Circle Animation
  static Animation<Offset> sixteenthCircleAnimation = offsetAnimation(
    beginOffsetX: 0.0,
    endOffsetX: -55.0,
    begin: 0.9375,
    end: 1.0,
  );

  static Animation<double> sixteenthScaleAnimation = scaleAnimation(
    beginScale: 0.5,
    endScale: 1.0,
    begin: 0.9375,
    end: 1.0,
  );
}
