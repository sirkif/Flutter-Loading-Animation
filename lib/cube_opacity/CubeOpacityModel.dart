import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CubeOpacityModel {
  static late AnimationController rhombusSplitController;

  static Animation<double> scaleSequenceAnimation({
    required double begin,
    required double end,
  }) {
    TweenSequence<double> opacityTweenSequence = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.45,
            end: 1,
          ),
          weight: 40,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1,
            end: 0.45,
          ),
          weight: 40,
        ),
      ],
    );

    Animation<double> opacityAnimation = opacityTweenSequence.animate(
      CurvedAnimation(
        parent: rhombusSplitController,
        curve: Interval(begin, end, curve: Curves.easeOut),
      ),
    );

    return opacityAnimation;
  }

  static Animation<double> orangeAnimation =
      scaleSequenceAnimation(begin: 0.0, end: 0.25);

  static Animation<double> purpleAnimation =
      scaleSequenceAnimation(begin: 0.25, end: 0.5);

  static Animation<double> greenAnimation =
      scaleSequenceAnimation(begin: 0.5, end: 0.75);

  static Animation<double> yellowAnimation =
      scaleSequenceAnimation(begin: 0.75, end: 1.0);
}
