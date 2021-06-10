import 'dart:ui';

import 'package:flutter/animation.dart';

class CubeOffsetModel {
  static late AnimationController cubeOffsetController;
  static late AnimationController slideTransitionController;

  static Animation<Offset> offsetAnimation({
    required double beginOffsetX,
    required double beginOffsetY,
  }) {
    Tween<Offset> offsetTween =
        Tween(begin: Offset(beginOffsetX, beginOffsetY), end: Offset.zero);

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: slideTransitionController,
        curve: Curves.easeOutSine,
      ),
    );

    return offsetAnimation;
  }

  static Animation<Offset> offsetSequenceAnimation({
    required Offset beginFirstOffset,
    required Offset endFirstOffset,
    required Offset beginSecondOffset,
    required Offset endSecondOffset,
    required Offset beginThirdOffset,
    required Offset endThirdOffset,
    required Offset beginFourthOffset,
    required Offset endFourthOffset,
  }) {
    TweenSequence<Offset> offsetTweenSequence = TweenSequence(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: beginFirstOffset,
            end: endFirstOffset,
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: beginSecondOffset,
            end: endSecondOffset,
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: beginThirdOffset,
            end: endThirdOffset,
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: beginFourthOffset,
            end: endFourthOffset,
          ),
          weight: 40,
        ),
      ],
    );

    Animation<Offset> cubeOffsetAnimation = offsetTweenSequence.animate(
      CurvedAnimation(
        parent: cubeOffsetController,
        curve: Curves.easeOutSine,
      ),
    );

    return cubeOffsetAnimation;
  }

  /////// Yellow Cube Animation
  static Animation<Offset> yellowSlideTransition = offsetAnimation(
    beginOffsetX: -0.15,
    beginOffsetY: 0.15,
  );

  static Animation<Offset> yellowCubeAnimation = offsetSequenceAnimation(
    beginFirstOffset: Offset(-15.0, 15.0),
    endFirstOffset: Offset(15.0, 15.0),
    beginSecondOffset: Offset(15.0, 15.0),
    endSecondOffset: Offset(15.0, -15.0),
    beginThirdOffset: Offset(15.0, -15.0),
    endThirdOffset: Offset(-15.0, -15.0),
    beginFourthOffset: Offset(-15.0, -15.0),
    endFourthOffset: Offset(-15.0, 15.0),
  );

  /////// Purple Cube Animation
  static Animation<Offset> purpleSlideTransition = offsetAnimation(
    beginOffsetX: 0.15,
    beginOffsetY: -0.15,
  );

  static Animation<Offset> purpleCubeAnimation = offsetSequenceAnimation(
    beginFirstOffset: Offset(15.0, -15.0),
    endFirstOffset: Offset(-15.0, -15.0),
    beginSecondOffset: Offset(-15.0, -15.0),
    endSecondOffset: Offset(-15.0, 15.0),
    beginThirdOffset: Offset(-15.0, 15.0),
    endThirdOffset: Offset(15.0, 15.0),
    beginFourthOffset: Offset(15.0, 15.0),
    endFourthOffset: Offset(15.0, -15.0),
  );

  /////// Green Cube Animation
  static Animation<Offset> greenSlideTransition = offsetAnimation(
    beginOffsetX: 0.15,
    beginOffsetY: 0.15,
  );

  static Animation<Offset> greenCubeAnimation = offsetSequenceAnimation(
    beginFirstOffset: Offset(15.0, 15.0),
    endFirstOffset: Offset(15.0, -15.0),
    beginSecondOffset: Offset(15.0, -15.0),
    endSecondOffset: Offset(-15.0, -15.0),
    beginThirdOffset: Offset(-15.0, -15.0),
    endThirdOffset: Offset(-15.0, 15.0),
    beginFourthOffset: Offset(-15.0, 15.0),
    endFourthOffset: Offset(15.0, 15.0),
  );

  /////// Orange Cube
  static Animation<Offset> orangeSlideTransition = offsetAnimation(
    beginOffsetX: -0.15,
    beginOffsetY: -0.15,
  );

  static Animation<Offset> orangeCubeAnimation = offsetSequenceAnimation(
    beginFirstOffset: Offset(-15.0, -15.0),
    endFirstOffset: Offset(-15.0, 15.0),
    beginSecondOffset: Offset(-15.0, 15.0),
    endSecondOffset: Offset(15.0, 15.0),
    beginThirdOffset: Offset(15.0, 15.0),
    endThirdOffset: Offset(15.0, -15.0),
    beginFourthOffset: Offset(15.0, -15.0),
    endFourthOffset: Offset(-15.0, -15.0),
  );
}
