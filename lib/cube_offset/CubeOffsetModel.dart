import 'dart:ui';

import 'package:flutter/animation.dart';

class CubeOffsetModel {
  static late AnimationController cubeOffsetController;
  static late AnimationController slideTransitionController;

  /////// Yellow Cube
  static late Animation<Offset> yellowCubeAnimation;
  static late Animation<Offset> yellowSlideTransition;
  static Tween<Offset> yellowTweenSlide = Tween(
    begin: Offset(-0.15, 0.15),
    end: Offset(0, 0),
  );
  static TweenSequence<Offset> yellowTweenSequence = TweenSequence(
    <TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, 20.0),
          end: Offset(20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, 20.0),
          end: Offset(20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, -20.0),
          end: Offset(-20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, -20.0),
          end: Offset(-20.0, 20.0),
        ),
        weight: 40,
      ),
    ],
  );

  /////// Purple Cube
  static late Animation<Offset> purpleCubeAnimation;
  static late Animation<Offset> purpleSlideTransition;
  static Tween<Offset> purpleTweenSlide = Tween(
    begin: Offset(0.15, -0.15),
    end: Offset(0, 0),
  );
  static TweenSequence<Offset> purpleTweenSequence = TweenSequence(
    <TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, -20.0),
          end: Offset(-20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, -20.0),
          end: Offset(-20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, 20.0),
          end: Offset(20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, 20.0),
          end: Offset(20.0, -20.0),
        ),
        weight: 40,
      ),
    ],
  );

  /////// Green Cube
  static late Animation<Offset> greenCubeAnimation;
  static late Animation<Offset> greenSlideTransition;
  static Tween<Offset> greenTweenSlide = Tween(
    begin: Offset(0.15, 0.15),
    end: Offset(0, 0),
  );
  static TweenSequence<Offset> greenTweenSequence = TweenSequence(
    <TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, 20.0),
          end: Offset(20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, -20.0),
          end: Offset(-20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, -20.0),
          end: Offset(-20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, 20.0),
          end: Offset(20.0, 20.0),
        ),
        weight: 40,
      ),
    ],
  );

  /////// Orange Cube
  static late Animation<Offset> orangeCubeAnimation;
  static late Animation<Offset> orangeSlideTransition;
  static Tween<Offset> orangeTweenSlide = Tween(
    begin: Offset(-0.15, -0.15),
    end: Offset(0, 0),
  );
  static TweenSequence<Offset> orangeTweenSequence = TweenSequence(
    <TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, -20.0),
          end: Offset(-20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(-20.0, 20.0),
          end: Offset(20.0, 20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, 20.0),
          end: Offset(20.0, -20.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset(20.0, -20.0),
          end: Offset(-20.0, -20.0),
        ),
        weight: 40,
      ),
    ],
  );
}
