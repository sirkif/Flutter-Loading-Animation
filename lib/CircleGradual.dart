import 'dart:math';

import 'package:flutter/material.dart';

import 'CircleGradualModel.dart';

class CircleGradual extends StatefulWidget {
  @override
  _CircleGradualState createState() => _CircleGradualState();
}

class _CircleGradualState extends State<CircleGradual>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    CircleGradualModel.circleGradualcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    CircleGradualModel.firstCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.0, 0.125, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.secondCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.125, 0.25, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.secondCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.125, 0.25, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.thirdCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.25, 0.375, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.fourthCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.375, 0.5, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.fifthCircleAnimation =
        CircleGradualModel.plusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.5, 0.625, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.sixthCircleAnimation =
        CircleGradualModel.minusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.625, 0.75, curve: Curves.easeOut),
      ),
    );
    CircleGradualModel.seventhCircleAnimation =
        CircleGradualModel.minusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.75, 0.875, curve: Curves.easeOut),
      ),
    );

    CircleGradualModel.eighthCircleAnimation =
        CircleGradualModel.minusOffsetTween.animate(
      CurvedAnimation(
        parent: CircleGradualModel.circleGradualcontroller,
        curve: Interval(0.875, 1, curve: Curves.easeOut),
      ),
    );

    // CircleGradualModel.circleGradualcontroller.forward();

    CircleGradualModel.circleGradualcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleGradualModel.circleGradualcontroller.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CircleGradualModel.circleGradualcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleGradualBuilder(
            angle: -(pi / 2),
            offset: CircleGradualModel.firstCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: -(pi / 4),
            offset: CircleGradualModel.secondCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: 0,
            offset: CircleGradualModel.thirdCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: (pi / 4),
            offset: CircleGradualModel.fourthCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: (pi / 2),
            offset: CircleGradualModel.fifthCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: -(pi / 4),
            offset: CircleGradualModel.sixthCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: 0,

            offset: CircleGradualModel.seventhCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualBuilder(
            angle: (pi / 4),
            offset: CircleGradualModel.eighthCircleAnimation,
            // opacityAnimation: CircleOpacityModel.opacityAnimation,
            circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
          ),
          CircleGradualShape(),
        ],
      ),
    );
  }
}

/////// Circle Gradual Builder
class CircleGradualBuilder extends StatelessWidget {
  final double angle;
  final Animation<Offset> offset;
  // final Animation<double> opacityAnimation;
  final Listenable circleGradualcontroller;

  const CircleGradualBuilder({
    required this.angle,
    required this.offset,
    // required this.opacityAnimation,
    required this.circleGradualcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return
        // FadeTransition(
        //   opacity: opacityAnimation,
        //   child:
        AnimatedBuilder(
      animation: circleGradualcontroller,
      child: CircleGradualShape(),
      builder: (context, child) => TransformRotateCircle(
        angle: angle,
        offset: offset.value,
        child: child!,
      ),
      // ),
    );
  }
}

/////// Transform Rotate Circle
class TransformRotateCircle extends StatelessWidget {
  final double angle;
  final Offset offset;
  final Widget child;

  const TransformRotateCircle({
    required this.angle,
    required this.offset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: offset,
        child: child,
      ),
    );
  }
}

/////// Circle Gradual Shape
class CircleGradualShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFFFFF5AB),
        shape: BoxShape.circle,
      ),
    );
  }
}
