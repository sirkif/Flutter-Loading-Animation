import 'package:flutter/material.dart';

import 'CircleColorsModel.dart';

class CircleColors extends StatefulWidget {
  @override
  _CircleColorsState createState() => _CircleColorsState();
}

class _CircleColorsState extends State<CircleColors>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    CircleColorsModel.circleColorsController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 16), () {
      CircleColorsModel.circleColorsController.forward();
    });

    // => DELETE THIS
    Future.delayed(Duration(seconds: 22), () {
      CircleColorsModel.circleColorsController.stop();
    });

    CircleColorsModel.circleColorsController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CircleColorsModel.circleColorsController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CircleColorsModel.circleColorsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          /////// White Circle
          CircleColorsBuilder(
            width: 10,
            height: 10,
            color: Color(0xFFF6F6F6),
            angle: CircleColorsModel.whiteCircleAnimation,
            circleColorsController: CircleColorsModel.circleColorsController,
          ),

          /////// Blue Circle
          CircleColorsBuilder(
            width: 20,
            height: 20,
            color: Color(0xFFB6C9F0),
            angle: CircleColorsModel.blueCircleAnimation,
            circleColorsController: CircleColorsModel.circleColorsController,
          ),

          /////// Orange Circle
          CircleColorsBuilder(
            width: 30,
            height: 30,
            color: Color(0xFFFFE5E2),
            angle: CircleColorsModel.yellowCircleAnimation,
            circleColorsController: CircleColorsModel.circleColorsController,
          ),

          /////// Orange Circle
          CircleColorsBuilder(
            width: 35,
            height: 35,
            color: Color(0xFFF5ABC9),
            angle: CircleColorsModel.orangeCircleAnimation,
            circleColorsController: CircleColorsModel.circleColorsController,
          ),

          /////// Pink Circle
          CircleColorsBuilder(
            width: 40,
            height: 40,
            color: Color(0xFFE93B81),
            angle: CircleColorsModel.pinkCircleAnimation,
            circleColorsController: CircleColorsModel.circleColorsController,
          ),
        ],
      ),
    );
  }
}

/////// Circle Colors Builder
class CircleColorsBuilder extends StatelessWidget {
  final double width;
  final double height;

  final Color color;
  final Animation<double> angle;
  final Listenable circleColorsController;

  const CircleColorsBuilder({
    required this.width,
    required this.height,
    required this.color,
    required this.angle,
    required this.circleColorsController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: circleColorsController,
      child: Transform.translate(
        offset: Offset(0.0, -90.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
      builder: (context, child) => Transform.rotate(
        angle: angle.value,
        child: child,
      ),
    );
  }
}
