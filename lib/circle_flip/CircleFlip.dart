import 'package:flutter/material.dart';

import 'CircleFlipModel.dart';

class CircleFlip extends StatefulWidget {
  @override
  _CircleFlipState createState() => _CircleFlipState();
}

class _CircleFlipState extends State<CircleFlip> with TickerProviderStateMixin {
  bool circleOpaciy = false;
  @override
  void initState() {
    super.initState();

    CircleFlipModel.circleFlipController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    /////// Red Circle
    CircleFlipModel.firstRedOffsetAnimation =
        CircleFlipModel.firstTweenRed.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.0, 0.5, curve: Curves.linear),
      ),
    );
    CircleFlipModel.secondRedOffsetAnimation =
        CircleFlipModel.secondTweenRed.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.5, 1.0, curve: Curves.linear),
      ),
    );

    /////// Blue Circle
    CircleFlipModel.firstBlueOffsetAnimation =
        CircleFlipModel.firstTweenBlue.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.0, 0.5, curve: Curves.linear),
      ),
    );
    CircleFlipModel.secondBlueOffsetAnimation =
        CircleFlipModel.secondTweenBlue.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.5, 1.0, curve: Curves.linear),
      ),
    );

    /////// Opacity Animation
    CircleFlipModel.firstOpacityAnimation =
        CircleFlipModel.firstTweenOpacity.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.5, 0.5, curve: Curves.linear),
      ),
    );
    CircleFlipModel.secondOpacityAnimation =
        CircleFlipModel.secondTweenOpacity.animate(
      CurvedAnimation(
        parent: CircleFlipModel.circleFlipController,
        curve: Interval(0.5, 0.5, curve: Curves.linear),
      ),
    );

    CircleFlipModel.circleFlipController.forward();

    CircleFlipModel.circleFlipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleFlipModel.circleFlipController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CircleFlipModel.circleFlipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: CircleFlipModel.circleFlipController,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF0061A8),
              shape: BoxShape.circle,
            ),
          ),
          builder: (context, child) => Transform.translate(
            offset: CircleFlipModel.secondBlueOffsetAnimation.value,
            child: Opacity(
              opacity: CircleFlipModel.secondOpacityAnimation.value,
              child: child,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: CircleFlipModel.circleFlipController,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFFF165D),
              shape: BoxShape.circle,
            ),
          ),
          builder: (context, child) => Transform.translate(
            offset: CircleFlipModel.firstRedOffsetAnimation.value,
            child: Opacity(
              opacity: CircleFlipModel.firstOpacityAnimation.value,
              child: child,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: CircleFlipModel.circleFlipController,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFFF165D),
              shape: BoxShape.circle,
            ),
          ),
          builder: (context, child) => Transform.translate(
            offset: CircleFlipModel.secondRedOffsetAnimation.value,
            child: Opacity(
              opacity: CircleFlipModel.secondOpacityAnimation.value,
              child: child,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: CircleFlipModel.circleFlipController,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF0061A8),
              shape: BoxShape.circle,
            ),
          ),
          builder: (context, child) => Transform.translate(
            offset: CircleFlipModel.firstBlueOffsetAnimation.value,
            child: Opacity(
              opacity: CircleFlipModel.firstOpacityAnimation.value,
              child: child,
            ),
          ),
        ),
      ],
    ));
  }
}
