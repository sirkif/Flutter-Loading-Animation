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
        milliseconds: 1500,
      ),
    );

    CubeOffsetModel.slideTransitionController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
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
          CubeOffsetBuilder(
            color: Color(0xFFFFCB77),
            slide: CubeOffsetModel.yellowSlideTransition,
            offset: CubeOffsetModel.yellowCubeAnimation,
          ),
          CubeOffsetBuilder(
            color: Color(0xFF867AE9),
            slide: CubeOffsetModel.purpleSlideTransition,
            offset: CubeOffsetModel.purpleCubeAnimation,
          ),
          CubeOffsetBuilder(
            color: Color(0xFF00B8A9),
            slide: CubeOffsetModel.greenSlideTransition,
            offset: CubeOffsetModel.greenCubeAnimation,
          ),
          CubeOffsetBuilder(
            color: Color(0xFFFE6D73),
            slide: CubeOffsetModel.orangeSlideTransition,
            offset: CubeOffsetModel.orangeCubeAnimation,
          ),
        ],
      ),
    );
  }
}

/////// Cube Offset Builder
class CubeOffsetBuilder extends StatelessWidget {
  final Color color;
  final Animation<Offset> slide;
  final Animation<Offset> offset;

  const CubeOffsetBuilder({
    required this.color,
    required this.slide,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CubeOffsetModel.cubeOffsetController,
      child: SlideTransition(
        position: slide,
        child: CubeShape(
          color: color,
        ),
      ),
      builder: (context, child) => Transform.translate(
        offset: offset.value,
        child: child,
      ),
    );
  }
}

/////// Cube Shape
class CubeShape extends StatelessWidget {
  final Color color;

  const CubeShape({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
