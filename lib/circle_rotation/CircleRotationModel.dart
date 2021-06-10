import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';

class CircleRotationModel {
  static late AnimationController circleRotationController;

  static Animation<double> rotateSequenceAnimation() {
    TweenSequence<double> rotateTweenSequence = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (0 * (pi / 180)),
            end: (360 * (pi / 180)),
          ),
          weight: 40,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (0 * (pi / 180)),
            end: (0 * (pi / 180)),
          ),
          weight: 20,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (360 * (pi / 180)),
            end: (720 * (pi / 180)),
          ),
          weight: 40,
        ),
      ],
    );

    Animation<double> rotateAnimation = rotateTweenSequence.animate(
      CurvedAnimation(parent: circleRotationController, curve: Curves.linear),
    );

    return rotateAnimation;
  }

  static Animation<double> scaleSequenceAnimation() {
    TweenSequence<double> scaleTweenSequence = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.8,
            end: 1.2,
          ),
          weight: 40,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1.2,
            end: 0.8,
          ),
          weight: 40,
        ),
      ],
    );

    Animation<double> scaleAnimation = scaleTweenSequence.animate(
      CurvedAnimation(parent: circleRotationController, curve: Curves.linear),
    );

    return scaleAnimation;
  }

  static Animation<Offset> offsetSequenceAnimation({
    required Offset endFirstOffset,
    required Offset beginSecondOffset,
  }) {
    TweenSequence<Offset> offsetTweenSequence = TweenSequence(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(0, 0),
            end: endFirstOffset,
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: beginSecondOffset,
            end: Offset(0, 0),
          ),
          weight: 40,
        ),
      ],
    );

    Animation<Offset> circleRotationAnimation = offsetTweenSequence.animate(
      CurvedAnimation(
        parent: circleRotationController,
        curve: Curves.easeInOut,
      ),
    );

    return circleRotationAnimation;
  }

  static Animation<double> rotateCircleAnimation = rotateSequenceAnimation();

  static Animation<double> scaleCircleAnimation = scaleSequenceAnimation();

  /////// Yellow Circle Animation
  static Animation<Offset> yellowCircleAnimation = offsetSequenceAnimation(
    endFirstOffset: Offset(-20, -20),
    beginSecondOffset: Offset(-20, -20),
  );

  /////// Purple Circle Animation
  static Animation<Offset> purpleCircleAnimation = offsetSequenceAnimation(
    endFirstOffset: Offset(-20, 20),
    beginSecondOffset: Offset(-20, 20),
  );

  /////// Green Circle Animation
  static Animation<Offset> greenCircleAnimation = offsetSequenceAnimation(
    endFirstOffset: Offset(20, -20),
    beginSecondOffset: Offset(20, -20),
  );

  /////// Orange Circle Animation
  static Animation<Offset> orangeCircleAnimation = offsetSequenceAnimation(
    endFirstOffset: Offset(20, 20),
    beginSecondOffset: Offset(20, 20),
  );
}
