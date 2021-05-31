import 'dart:math';

import 'package:flutter/material.dart';

class CircleOpacity extends StatefulWidget {
  @override
  _CircleOpacityState createState() => _CircleOpacityState();
}

class _CircleOpacityState extends State<CircleOpacity>
    with TickerProviderStateMixin {
  late AnimationController circleOpacityController;
  late AnimationController circleRotationController;
  late Animation<double> rotationAnimation;
  late Animation<double> opacityAnimation;
  late Animation<Offset> offsetAnimation;

  Tween<double> tweenOpacity = Tween(begin: 1.0, end: 0.0);

  Tween<Offset> tweenOffset =
      Tween(begin: Offset(0.0, 0.0), end: Offset(55.0, 0.0));

  @override
  void initState() {
    super.initState();

    circleOpacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );
    circleRotationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );

    opacityAnimation = tweenOpacity.animate(circleOpacityController);
    offsetAnimation = tweenOffset.animate(
      CurvedAnimation(parent: circleOpacityController, curve: Curves.linear),
    );

    rotationAnimation = CurvedAnimation(
      parent: circleRotationController,
      curve: Curves.linear,
    );

    circleOpacityController.forward();

    Future.delayed(Duration(milliseconds: 1800), () {
      circleRotationController.forward();
    });

    circleRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        circleRotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    circleOpacityController.dispose();
    circleRotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildCircleOpacity(),
            buildCircleRotation(),
          ],
        ),
      ),
    );
  }

  Stack buildCircleOpacity() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleOpacityBuilder(
          width: 10,
          height: 10,
          angle: -(pi / 4),
          colorOpacity: 0.15,
          minusOffset: false,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 13,
          height: 13,
          angle: 0,
          colorOpacity: 0.2,
          minusOffset: false,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 16,
          height: 16,
          angle: (pi / 4),
          colorOpacity: 0.3,
          minusOffset: false,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 19,
          height: 19,
          angle: (pi / 2),
          colorOpacity: 0.4,
          minusOffset: false,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 21,
          height: 21,
          angle: -(pi / 4),
          colorOpacity: 0.5,
          minusOffset: true,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 24,
          height: 24,
          angle: 0,
          colorOpacity: 0.6,
          minusOffset: true,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 27,
          height: 27,
          angle: (pi / 4),
          colorOpacity: 0.8,
          minusOffset: true,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 30,
          height: 30,
          angle: -(pi / 2),
          colorOpacity: 1,
          minusOffset: false,
          offset: offsetAnimation,
          opacityAnimation: opacityAnimation,
          circleOpacityController: circleOpacityController,
        ),
      ],
    );
  }

  RotationTransition buildCircleRotation() {
    return RotationTransition(
      turns: rotationAnimation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TransformRotateCircle(
            angle: -(pi / 4),
            offset: Offset(55.0, 0.0),
            child: CircleShape(
              width: 10,
              height: 10,
              colorOpacity: 0.15,
            ),
          ),
          TransformRotateCircle(
            angle: 0,
            offset: Offset(55.0, 0.0),
            child: CircleShape(
              width: 13,
              height: 13,
              colorOpacity: 0.2,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 4),
            offset: Offset(55.0, 0.0),
            child: CircleShape(
              width: 16,
              height: 16,
              colorOpacity: 0.3,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 2),
            offset: Offset(55.0, 0.0),
            child: CircleShape(
              width: 19,
              height: 19,
              colorOpacity: 0.4,
            ),
          ),
          TransformRotateCircle(
            angle: -(pi / 4),
            offset: Offset(-55.0, 0.0),
            child: CircleShape(
              width: 21,
              height: 21,
              colorOpacity: 0.5,
            ),
          ),
          TransformRotateCircle(
            angle: 0,
            offset: Offset(-55.0, 0.0),
            child: CircleShape(
              width: 24,
              height: 24,
              colorOpacity: 0.6,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 4),
            offset: Offset(-55.0, 0.0),
            child: CircleShape(
              width: 27,
              height: 27,
              colorOpacity: 0.8,
            ),
          ),
          TransformRotateCircle(
            angle: -(pi / 2),
            offset: Offset(55.0, 0.0),
            child: CircleShape(
              width: 30,
              height: 30,
              colorOpacity: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/////// Circle Opacity Builder
class CircleOpacityBuilder extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final double colorOpacity;
  final bool minusOffset;
  final Animation<Offset> offset;
  final Animation<double> opacityAnimation;
  final Listenable circleOpacityController;

  const CircleOpacityBuilder({
    required this.width,
    required this.height,
    required this.angle,
    required this.colorOpacity,
    required this.minusOffset,
    required this.offset,
    required this.opacityAnimation,
    required this.circleOpacityController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: AnimatedBuilder(
        animation: circleOpacityController,
        child: CircleShape(
          width: width,
          height: height,
          colorOpacity: colorOpacity,
        ),
        builder: (context, child) => TransformRotateCircle(
          angle: angle,
          offset: minusOffset ? -offset.value : offset.value,
          child: child!,
        ),
      ),
    );
  }
}

class CircleRotationBuilder extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final double colorOpacity;
  final bool minusOffset;
  final Animation<Offset> offset;
  final Listenable circleOpacityController;

  const CircleRotationBuilder({
    required this.width,
    required this.height,
    required this.angle,
    required this.colorOpacity,
    required this.minusOffset,
    required this.offset,
    required this.circleOpacityController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: circleOpacityController,
      child: CircleShape(
        width: width,
        height: height,
        colorOpacity: colorOpacity,
      ),
      builder: (context, child) => TransformRotateCircle(
        angle: angle,
        offset: minusOffset ? -offset.value : offset.value,
        child: child!,
      ),
    );
  }
}

class CircleShape extends StatelessWidget {
  final double width;
  final double height;
  final double colorOpacity;

  const CircleShape({
    required this.width,
    required this.height,
    required this.colorOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFFFFF5AB).withOpacity(colorOpacity),
        shape: BoxShape.circle,
      ),
    );
  }
}

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
