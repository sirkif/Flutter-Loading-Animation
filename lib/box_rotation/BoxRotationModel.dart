import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';

class BoxRotationModel {
  static late AnimationController boxRotationController;

  static Animation<double> rotateAnimation({
    required double beginRotation,
    required double endRotation,
    required double begin,
    required double end,
  }) {
    Tween<double> rotateTween = Tween(begin: beginRotation, end: endRotation);

    Animation<double> rotateAnimation = rotateTween.animate(
      CurvedAnimation(
        parent: boxRotationController,
        curve: Interval(begin, end, curve: Curves.linear),
      ),
    );

    return rotateAnimation;
  }

  static Animation<Offset> offsetAnimation({
    required Offset beginOffset,
    required Offset endOffset,
    required double begin,
    required double end,
  }) {
    Tween<Offset> offsetTween = Tween(begin: beginOffset, end: endOffset);

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: boxRotationController,
        curve: Interval(begin, end, curve: Curves.linear),
      ),
    );

    return offsetAnimation;
  }

  /////// 1 Rotate Animation
  static Animation<double> firstRotateAnimation = rotateAnimation(
    beginRotation: (45 * (pi / 180)),
    endRotation: (135 * (pi / 180)),
    begin: 0.0,
    end: 0.166,
  );

  /////// Orange Cube Animation
  static Animation<Offset> orangeCubeAnimation = offsetAnimation(
    beginOffset: Offset(-17.0, 17.0),
    endOffset: Offset(-17.0, -17.0),
    begin: 0.167,
    end: 0.333,
  );

  /////// 2 Rotate Animation
  static Animation<double> secondRotateAnimation = rotateAnimation(
    beginRotation: (135 * (pi / 180)),
    endRotation: (225 * (pi / 180)),
    begin: 0.333,
    end: 0.499,
  );

  /////// Yellow Cube Animation
  static Animation<Offset> yellowCubeAnimation = offsetAnimation(
    beginOffset: Offset(17.0, 17.0),
    endOffset: Offset(-17.0, 17.0),
    begin: 0.5,
    end: 0.666,
  );

  /////// 3 Rotate Animation
  static Animation<double> thirdRotateAnimation = rotateAnimation(
    beginRotation: (225 * (pi / 180)),
    endRotation: (315 * (pi / 180)),
    begin: 0.666,
    end: 0.832,
  );

  /////// Green Cube Animation
  static Animation<Offset> greenCubeAnimation = offsetAnimation(
    beginOffset: Offset(17.0, -17.0),
    endOffset: Offset(17.0, 17.0),
    begin: 0.832,
    end: 0.998,
  );
}
