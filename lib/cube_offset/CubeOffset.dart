import 'package:flutter/material.dart';

import 'CubeOffsetModel.dart';

class CubeOffset extends StatefulWidget {
  @override
  _CubeOffsetState createState() => _CubeOffsetState();
}

class _CubeOffsetState extends State<CubeOffset> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    CubeOffsetModel.cubeOffsetController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    CubeOffsetModel.slideTransitionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 1), () {
      CubeOffsetModel.slideTransitionController.forward();
    });

    CubeOffsetModel.slideTransitionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CubeOffsetModel.cubeOffsetController.forward();
      }
    });

    CubeOffsetModel.cubeOffsetController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CubeOffsetModel.cubeOffsetController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CubeOffsetModel.cubeOffsetController.dispose();
    CubeOffsetModel.slideTransitionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: CubeOffsetModel.cubeOffsetController,
            child: SlideTransition(
              position: CubeOffsetModel.yellowSlideTransition,
              child: CubeShape(
                color: Color(0xFFFFCB77),
              ),
            ),
            builder: (context, child) => Transform.translate(
              offset: CubeOffsetModel.yellowCubeAnimation.value,
              child: child,
            ),
          ),
          AnimatedBuilder(
            animation: CubeOffsetModel.cubeOffsetController,
            child: SlideTransition(
              position: CubeOffsetModel.purpleSlideTransition,
              child: CubeShape(
                color: Color(0xFF867AE9),
              ),
            ),
            builder: (context, child) => Transform.translate(
              offset: CubeOffsetModel.purpleCubeAnimation.value,
              child: child,
            ),
          ),
          AnimatedBuilder(
            animation: CubeOffsetModel.cubeOffsetController,
            child: SlideTransition(
              position: CubeOffsetModel.greenSlideTransition,
              child: CubeShape(
                color: Color(0xFF00B8A9),
              ),
            ),
            builder: (context, child) => Transform.translate(
              offset: CubeOffsetModel.greenCubeAnimation.value,
              child: child,
            ),
          ),
          AnimatedBuilder(
            animation: CubeOffsetModel.cubeOffsetController,
            child: SlideTransition(
              position: CubeOffsetModel.orangeSlideTransition,
              child: CubeShape(
                color: Color(0xFFFE6D73),
              ),
            ),
            builder: (context, child) => Transform.translate(
              offset: CubeOffsetModel.orangeCubeAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class CubeShape extends StatelessWidget {
  final Color color;

  const CubeShape({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
