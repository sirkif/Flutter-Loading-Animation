import 'package:flutter/material.dart';

import 'CircleRotationModel.dart';

class CircleRotation extends StatefulWidget {
  const CircleRotation({Key? key}) : super(key: key);

  @override
  _CircleRotationState createState() => _CircleRotationState();
}

class _CircleRotationState extends State<CircleRotation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    CircleRotationModel.circleRotationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 2), () {
      CircleRotationModel.circleRotationController.forward();
    });

    CircleRotationModel.circleRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleRotationModel.circleRotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CircleRotationModel.circleRotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: CircleRotationModel.circleRotationController,
        builder: (context, child) => Transform.rotate(
          angle: CircleRotationModel.rotateCircleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleOffsetBuilder(
                color: Color(0xFFFFCB77),
                offset: CircleRotationModel.yellowCircleAnimation,
              ),
              CircleOffsetBuilder(
                color: Color(0xFF867AE9),
                offset: CircleRotationModel.purpleCircleAnimation,
              ),
              CircleOffsetBuilder(
                color: Color(0xFF00B8A9),
                offset: CircleRotationModel.greenCircleAnimation,
              ),
              CircleOffsetBuilder(
                color: Color(0xFFFE6D73),
                offset: CircleRotationModel.orangeCircleAnimation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////// Circle Offset Builder
class CircleOffsetBuilder extends StatelessWidget {
  final Color color;
  final Animation<Offset> offset;

  const CircleOffsetBuilder({
    required this.color,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CircleRotationModel.circleRotationController,
      child: CircleRotationShape(
        color: color,
      ),
      builder: (context, child) => Transform.translate(
        offset: offset.value,
        child: Transform.scale(
          scale: CircleRotationModel.scaleCircleAnimation.value,
          child: child,
        ),
      ),
    );
  }
}

class CircleRotationShape extends StatelessWidget {
  final Color color;

  const CircleRotationShape({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
