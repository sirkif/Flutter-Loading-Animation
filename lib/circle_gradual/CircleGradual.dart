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

    CircleGradualModel.circleGradualcontroller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 4,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 40), () {
      CircleGradualModel.circleGradualcontroller.forward();
    });

    // => DELETE THIS
    Future.delayed(Duration(seconds: 46), () {
      CircleGradualModel.circleGradualcontroller.stop();
    });

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
        children: [
          buildFirstCollection(),
          buildSecondCollection(),
        ],
      ),
    );
  }

  Stack buildFirstCollection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleGradualBuilder(
          angle: -(pi / 2),
          scaleAnimation: CircleGradualModel.firstScaleAnimation,
          offsetAnimation: CircleGradualModel.firstCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: -(pi / 4),
          scaleAnimation: CircleGradualModel.secondScaleAnimation,
          offsetAnimation: CircleGradualModel.secondCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: 0,
          scaleAnimation: CircleGradualModel.thirdScaleAnimation,
          offsetAnimation: CircleGradualModel.thirdCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 4),
          scaleAnimation: CircleGradualModel.fourthScaleAnimation,
          offsetAnimation: CircleGradualModel.fourthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 2),
          scaleAnimation: CircleGradualModel.fifthScaleAnimation,
          offsetAnimation: CircleGradualModel.fifthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: -(pi / 4),
          scaleAnimation: CircleGradualModel.sixthScaleAnimation,
          offsetAnimation: CircleGradualModel.sixthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: 0,
          scaleAnimation: CircleGradualModel.seventhScaleAnimation,
          offsetAnimation: CircleGradualModel.seventhCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 4),
          scaleAnimation: CircleGradualModel.eighthScaleAnimation,
          offsetAnimation: CircleGradualModel.eighthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualShape(),
      ],
    );
  }

  Stack buildSecondCollection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleGradualBuilder(
          angle: -(pi / 2),
          scaleAnimation: CircleGradualModel.ninthScaleAnimation,
          offsetAnimation: CircleGradualModel.ninthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: -(pi / 4),
          scaleAnimation: CircleGradualModel.tenthScaleAnimation,
          offsetAnimation: CircleGradualModel.tenthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: 0,
          scaleAnimation: CircleGradualModel.eleventhScaleAnimation,
          offsetAnimation: CircleGradualModel.eleventhCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 4),
          scaleAnimation: CircleGradualModel.twelfthScaleAnimation,
          offsetAnimation: CircleGradualModel.twelfthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 2),
          scaleAnimation: CircleGradualModel.thirteenthScaleAnimation,
          offsetAnimation: CircleGradualModel.thirteenthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: -(pi / 4),
          scaleAnimation: CircleGradualModel.fourteenthScaleAnimation,
          offsetAnimation: CircleGradualModel.fourteenthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: 0,
          scaleAnimation: CircleGradualModel.fifteenthScaleAnimation,
          offsetAnimation: CircleGradualModel.fifteenthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualBuilder(
          angle: (pi / 4),
          scaleAnimation: CircleGradualModel.sixteenthScaleAnimation,
          offsetAnimation: CircleGradualModel.sixteenthCircleAnimation,
          circleGradualcontroller: CircleGradualModel.circleGradualcontroller,
        ),
        CircleGradualShape(),
      ],
    );
  }
}

/////// Circle Gradual Builder
class CircleGradualBuilder extends StatelessWidget {
  final double angle;
  final Animation<double> scaleAnimation;
  final Animation<Offset> offsetAnimation;
  final Listenable circleGradualcontroller;

  const CircleGradualBuilder({
    required this.angle,
    required this.scaleAnimation,
    required this.offsetAnimation,
    required this.circleGradualcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: circleGradualcontroller,
      child: CircleGradualShape(),
      builder: (context, child) => TransformCircleGradual(
        angle: angle,
        scale: scaleAnimation.value,
        offset: offsetAnimation.value,
        child: child!,
      ),
    );
  }
}

/////// Transform Circle Gradual
class TransformCircleGradual extends StatelessWidget {
  final double angle;
  final double scale;
  final Offset offset;
  final Widget child;

  const TransformCircleGradual({
    required this.angle,
    required this.scale,
    required this.offset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: scale,
      child: Transform.scale(
        scale: scale,
        child: Transform.rotate(
          angle: angle,
          child: Transform.translate(
            offset: offset,
            child: child,
          ),
        ),
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
