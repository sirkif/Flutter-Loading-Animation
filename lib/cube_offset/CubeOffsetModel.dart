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
        Tween(begin: Offset(beginOffsetX, beginOffsetY), end: Offset(0, 0));

    Animation<Offset> offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: slideTransitionController,
        curve: Curves.easeOutSine,
      ),
    );

    return offsetAnimation;
  }

  static Animation<Offset> offsetSequenceAnimation({
    required double beginFirstOffsetX,
    required double beginFirstOffsetY,
    required double endFirstOffsetX,
    required double endFirstOffsetY,
    required double beginSecondOffsetX,
    required double beginSecondOffsetY,
    required double endSecondOffsetX,
    required double endSecondOffsetY,
    required double beginThirdOffsetX,
    required double beginThirdOffsetY,
    required double endThirdOffsetX,
    required double endThirdOffsetY,
    required double beginFourthOffsetX,
    required double beginFourthOffsetY,
    required double endFourthOffsetX,
    required double endFourthOffsetY,
  }) {
    TweenSequence<Offset> yellowTweenSequence = TweenSequence(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(beginFirstOffsetX, beginFirstOffsetY),
            end: Offset(endFirstOffsetX, endFirstOffsetY),
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(beginSecondOffsetX, beginSecondOffsetY),
            end: Offset(endSecondOffsetX, endSecondOffsetY),
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(beginThirdOffsetX, beginThirdOffsetY),
            end: Offset(endThirdOffsetX, endThirdOffsetY),
          ),
          weight: 40,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(beginFourthOffsetX, beginFourthOffsetY),
            end: Offset(endFourthOffsetX, endFourthOffsetY),
          ),
          weight: 40,
        ),
      ],
    );

    Animation<Offset> cubeAnimation = yellowTweenSequence.animate(
      CurvedAnimation(
        parent: cubeOffsetController,
        curve: Curves.easeOutQuad,
      ),
    );

    return cubeAnimation;
  }

  /////// Yellow Cube Animation
  static Animation<Offset> yellowSlideTransition = offsetAnimation(
    beginOffsetX: -0.15,
    beginOffsetY: 0.15,
  );

  static Animation<Offset> yellowCubeAnimation = offsetSequenceAnimation(
    beginFirstOffsetX: -20.0,
    beginFirstOffsetY: 20.0,
    endFirstOffsetX: 20.0,
    endFirstOffsetY: 20.0,
    beginSecondOffsetX: 20.0,
    beginSecondOffsetY: 20.0,
    endSecondOffsetX: 20.0,
    endSecondOffsetY: -20.0,
    beginThirdOffsetX: 20.0,
    beginThirdOffsetY: -20.0,
    endThirdOffsetX: -20.0,
    endThirdOffsetY: -20.0,
    beginFourthOffsetX: -20.0,
    beginFourthOffsetY: -20.0,
    endFourthOffsetX: -20.0,
    endFourthOffsetY: 20.0,
  );

  /////// Purple Cube Animation
  static Animation<Offset> purpleSlideTransition = offsetAnimation(
    beginOffsetX: 0.15,
    beginOffsetY: -0.15,
  );

  static Animation<Offset> purpleCubeAnimation = offsetSequenceAnimation(
    beginFirstOffsetX: 20.0,
    beginFirstOffsetY: -20.0,
    endFirstOffsetX: -20.0,
    endFirstOffsetY: -20.0,
    beginSecondOffsetX: -20.0,
    beginSecondOffsetY: -20.0,
    endSecondOffsetX: -20.0,
    endSecondOffsetY: 20.0,
    beginThirdOffsetX: -20.0,
    beginThirdOffsetY: 20.0,
    endThirdOffsetX: 20.0,
    endThirdOffsetY: 20.0,
    beginFourthOffsetX: 20.0,
    beginFourthOffsetY: 20.0,
    endFourthOffsetX: 20.0,
    endFourthOffsetY: -20.0,
  );

  /////// Green Cube Animation
  static Animation<Offset> greenSlideTransition = offsetAnimation(
    beginOffsetX: 0.15,
    beginOffsetY: 0.15,
  );

  static Animation<Offset> greenCubeAnimation = offsetSequenceAnimation(
    beginFirstOffsetX: 20.0,
    beginFirstOffsetY: 20.0,
    endFirstOffsetX: 20.0,
    endFirstOffsetY: -20.0,
    beginSecondOffsetX: 20.0,
    beginSecondOffsetY: -20.0,
    endSecondOffsetX: -20.0,
    endSecondOffsetY: -20.0,
    beginThirdOffsetX: -20.0,
    beginThirdOffsetY: -20.0,
    endThirdOffsetX: -20.0,
    endThirdOffsetY: 20.0,
    beginFourthOffsetX: -20.0,
    beginFourthOffsetY: 20.0,
    endFourthOffsetX: 20.0,
    endFourthOffsetY: 20.0,
  );

  /////// Orange Cube
  static Animation<Offset> orangeSlideTransition = offsetAnimation(
    beginOffsetX: -0.15,
    beginOffsetY: -0.15,
  );

  static Animation<Offset> orangeCubeAnimation = offsetSequenceAnimation(
    beginFirstOffsetX: -20.0,
    beginFirstOffsetY: -20.0,
    endFirstOffsetX: -20.0,
    endFirstOffsetY: 20.0,
    beginSecondOffsetX: -20.0,
    beginSecondOffsetY: 20.0,
    endSecondOffsetX: 20.0,
    endSecondOffsetY: 20.0,
    beginThirdOffsetX: 20.0,
    beginThirdOffsetY: 20.0,
    endThirdOffsetX: 20.0,
    endThirdOffsetY: -20.0,
    beginFourthOffsetX: 20.0,
    beginFourthOffsetY: -20.0,
    endFourthOffsetX: -20.0,
    endFourthOffsetY: -20.0,
  );
}
