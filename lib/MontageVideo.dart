import 'package:flutter/material.dart';
import 'package:flutter_loading_animation/capsule_spacing/CapsuleSpacing.dart';
import 'package:flutter_loading_animation/circle_colors/CircleColors.dart';
import 'package:flutter_loading_animation/circle_flip/CircleFlip.dart';
import 'package:flutter_loading_animation/circle_gradual/CircleGradual.dart';
import 'package:flutter_loading_animation/circle_opacity/CircleOpacity.dart';
import 'package:flutter_loading_animation/cube_offset/CubeOffset.dart';

class MontageVideo extends StatefulWidget {
  const MontageVideo({Key? key}) : super(key: key);

  @override
  _MontageVideoState createState() => _MontageVideoState();
}

class _MontageVideoState extends State<MontageVideo>
    with TickerProviderStateMixin {
  late AnimationController montageVideoController;

  late AnimationController fadeTransitionController;
  late Animation<double> fadeTransitionAnimation;
  Tween<double> fadeTransitionTween = Tween(begin: 1.0, end: 0.0);

  late AnimationController slidingController;
  late Animation<Offset> slidingAnimation;
  Tween<Offset> slidingTween = Tween(
    begin: Offset(0.0, -4.0),
    end: Offset.zero,
  );

  late Animation<double> animationOpacityAnimation;
  TweenSequence<double> opacityAnimationTween = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.0,
        ),
        weight: 40,
      ),
    ],
  );

  late Animation<double> oneOpacityAnimation;
  late Animation<double> oneScaleAnimation;
  late Animation<double> twoOpacityAnimation;
  late Animation<double> twoScaleAnimation;
  late Animation<double> threeOpacityAnimation;
  late Animation<double> threeScaleAnimation;
  TweenSequence<double> opacityTween = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.0,
        ),
        weight: 40,
      ),
    ],
  );
  Tween<double> scaleTween = Tween(begin: 90.0, end: 35.0);

  @override
  void initState() {
    super.initState();
    montageVideoController = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );
    fadeTransitionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    slidingController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animationOpacityAnimation = opacityAnimationTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    oneOpacityAnimation = opacityTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.5, 0.75, curve: Curves.easeOut),
      ),
    );

    oneScaleAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.5, 0.75, curve: Curves.easeOut),
      ),
    );
    twoOpacityAnimation = opacityTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );
    twoScaleAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    threeOpacityAnimation = opacityTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    threeScaleAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: montageVideoController,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    fadeTransitionAnimation =
        fadeTransitionTween.animate(fadeTransitionController);

    slidingAnimation = slidingTween.animate(
      CurvedAnimation(
        parent: slidingController,
        curve: Curves.bounceOut,
      ),
    );
    Future.delayed(Duration(seconds: 1), () {
      montageVideoController.forward();
    });

    Future.delayed(Duration(seconds: 56), () {
      fadeTransitionController.forward();
    });

    Future.delayed(Duration(seconds: 57), () {
      slidingController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();

    montageVideoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        FadeTransition(
          opacity: fadeTransitionAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: montageVideoController,
                builder: (context, child) => Opacity(
                  opacity: animationOpacityAnimation.value,
                  child: buildAnimation(),
                ),
              ),
              buildCounter(),
            ],
          ),
        ),
        SlideTransition(
          position: slidingAnimation,
          child: Text(
            "Thanks for watching 🥳🥳",
            style: TextStyle(
              fontSize: 90,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Stack buildCounter() {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: montageVideoController,
          builder: (context, child) => Transform.scale(
            scale: oneScaleAnimation.value,
            child: Opacity(
              opacity: oneOpacityAnimation.value,
              child: Text(
                "1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: montageVideoController,
          builder: (context, child) => Transform.scale(
            scale: twoScaleAnimation.value,
            child: Opacity(
              opacity: twoOpacityAnimation.value,
              child: Text(
                "2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: montageVideoController,
          builder: (context, child) => Transform.scale(
            scale: threeScaleAnimation.value,
            child: Opacity(
              opacity: threeOpacityAnimation.value,
              child: Text(
                "3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GridView buildAnimation() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1 / 0.7,
      children: [
        Container(
          child: CircleOpacity(),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
            ),
          ),
        ),
        Container(
          child: CircleColors(),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
              bottom: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
            ),
          ),
        ),
        Container(
          child: CapsuleSpacing(),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
              bottom: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
            ),
          ),
        ),
        Container(
          child: CircleFlip(),
        ),
        Container(
          child: CubeOffset(),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
            ),
          ),
        ),
        Container(
          child: CircleGradual(),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.yellow.shade700,
                width: 4.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
