import 'dart:math';

import 'package:flutter/material.dart';

import 'CircleOpacityModel.dart';

class CircleOpacity extends StatefulWidget {
  @override
  _CircleOpacityState createState() => _CircleOpacityState();
}

class _CircleOpacityState extends State<CircleOpacity>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    CircleOpacityModel.circleOpacityController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    CircleOpacityModel.circleRotationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 1), () {
      CircleOpacityModel.circleOpacityController.forward();
    });

    CircleOpacityModel.circleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleOpacityModel.circleRotationController.forward();
      }
    });

    CircleOpacityModel.circleRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleOpacityModel.circleRotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CircleOpacityModel.circleOpacityController.dispose();
    CircleOpacityModel.circleRotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildCircleOpacity(),
          buildCircleRotation(),
        ],
      ),
    );
  }

  /////// Build Circle Opacity
  Stack buildCircleOpacity() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleOpacityBuilder(
          width: 10,
          height: 10,
          angle: -(pi / 4),
          colorOpacity: 0.15,
          offsetAnimation: CircleOpacityModel.plusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 13,
          height: 13,
          angle: 0,
          colorOpacity: 0.2,
          offsetAnimation: CircleOpacityModel.plusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 16,
          height: 16,
          angle: (pi / 4),
          colorOpacity: 0.3,
          offsetAnimation: CircleOpacityModel.plusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 19,
          height: 19,
          angle: (pi / 2),
          colorOpacity: 0.4,
          offsetAnimation: CircleOpacityModel.plusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 21,
          height: 21,
          angle: -(pi / 4),
          colorOpacity: 0.5,
          offsetAnimation: CircleOpacityModel.minusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 24,
          height: 24,
          angle: 0,
          colorOpacity: 0.6,
          offsetAnimation: CircleOpacityModel.minusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 27,
          height: 27,
          angle: (pi / 4),
          colorOpacity: 0.8,
          offsetAnimation: CircleOpacityModel.minusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
        CircleOpacityBuilder(
          width: 30,
          height: 30,
          angle: -(pi / 2),
          colorOpacity: 1,
          offsetAnimation: CircleOpacityModel.plusOffsetAnimation,
          opacityAnimation: CircleOpacityModel.opacityAnimation,
          circleOpacityController: CircleOpacityModel.circleOpacityController,
        ),
      ],
    );
  }

  /////// Build Circle Rotation
  RotationTransition buildCircleRotation() {
    return RotationTransition(
      turns: CircleOpacityModel.rotationAnimation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TransformRotateCircle(
            angle: -(pi / 4),
            offset: Offset(55.0, 0.0),
            child: CircleOpacityShape(
              width: 10,
              height: 10,
              colorOpacity: 0.15,
            ),
          ),
          TransformRotateCircle(
            angle: 0,
            offset: Offset(55.0, 0.0),
            child: CircleOpacityShape(
              width: 13,
              height: 13,
              colorOpacity: 0.2,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 4),
            offset: Offset(55.0, 0.0),
            child: CircleOpacityShape(
              width: 16,
              height: 16,
              colorOpacity: 0.3,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 2),
            offset: Offset(55.0, 0.0),
            child: CircleOpacityShape(
              width: 19,
              height: 19,
              colorOpacity: 0.4,
            ),
          ),
          TransformRotateCircle(
            angle: -(pi / 4),
            offset: Offset(-55.0, 0.0),
            child: CircleOpacityShape(
              width: 21,
              height: 21,
              colorOpacity: 0.5,
            ),
          ),
          TransformRotateCircle(
            angle: 0,
            offset: Offset(-55.0, 0.0),
            child: CircleOpacityShape(
              width: 24,
              height: 24,
              colorOpacity: 0.6,
            ),
          ),
          TransformRotateCircle(
            angle: (pi / 4),
            offset: Offset(-55.0, 0.0),
            child: CircleOpacityShape(
              width: 27,
              height: 27,
              colorOpacity: 0.8,
            ),
          ),
          TransformRotateCircle(
            angle: -(pi / 2),
            offset: Offset(55.0, 0.0),
            child: CircleOpacityShape(
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
  final Animation<Offset> offsetAnimation;
  final Animation<double> opacityAnimation;
  final Listenable circleOpacityController;

  const CircleOpacityBuilder({
    required this.width,
    required this.height,
    required this.angle,
    required this.colorOpacity,
    required this.offsetAnimation,
    required this.opacityAnimation,
    required this.circleOpacityController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: AnimatedBuilder(
        animation: circleOpacityController,
        child: CircleOpacityShape(
          width: width,
          height: height,
          colorOpacity: colorOpacity,
        ),
        builder: (context, child) => TransformRotateCircle(
          angle: angle,
          offset: offsetAnimation.value,
          child: child!,
        ),
      ),
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

/////// Circle Opacity Shape
class CircleOpacityShape extends StatelessWidget {
  final double width;
  final double height;
  final double colorOpacity;

  const CircleOpacityShape({
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
