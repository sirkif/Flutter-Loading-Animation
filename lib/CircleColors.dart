import 'dart:math';

import 'package:flutter/material.dart';

class CircleColors extends StatefulWidget {
  @override
  _CircleColorsState createState() => _CircleColorsState();
}

class _CircleColorsState extends State<CircleColors>
    with SingleTickerProviderStateMixin {
  late AnimationController circleColorsController;
  late Animation<double> whiteCircleAnimation;
  late Animation<double> blueCircleAnimation;
  late Animation<double> yellowCircleAnimation;
  late Animation<double> orangeCircleAnimation;
  late Animation<double> pinkCircleAnimation;
  Tween<double> tween = Tween(begin: 0.0, end: 2 * pi);

  @override
  void initState() {
    super.initState();

    circleColorsController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    whiteCircleAnimation = tween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    blueCircleAnimation = tween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    yellowCircleAnimation = tween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );

    orangeCircleAnimation = tween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(0.1, 1.0, curve: Curves.easeInOut),
      ),
    );

    pinkCircleAnimation = tween.animate(
      CurvedAnimation(
        parent: circleColorsController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    circleColorsController.forward();

    circleColorsController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        circleColorsController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    circleColorsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /////// White Circle
            CircleColorsBuilder(
              width: 10,
              height: 10,
              color: Color(0xFFF6F6F6),
              angle: whiteCircleAnimation,
              circleColorsController: circleColorsController,
            ),

            /////// Blue Circle
            CircleColorsBuilder(
              width: 20,
              height: 20,
              color: Color(0xFFB6C9F0),
              angle: blueCircleAnimation,
              circleColorsController: circleColorsController,
            ),

            /////// Orange Circle
            CircleColorsBuilder(
              width: 30,
              height: 30,
              color: Color(0xFFFFE5E2),
              angle: yellowCircleAnimation,
              circleColorsController: circleColorsController,
            ),

            /////// Orange Circle
            CircleColorsBuilder(
              width: 35,
              height: 35,
              color: Color(0xFFF5ABC9),
              angle: orangeCircleAnimation,
              circleColorsController: circleColorsController,
            ),

            /////// Pink Circle
            CircleColorsBuilder(
              width: 40,
              height: 40,
              color: Color(0xFFE93B81),
              angle: pinkCircleAnimation,
              circleColorsController: circleColorsController,
            ),
          ],
        ),
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
