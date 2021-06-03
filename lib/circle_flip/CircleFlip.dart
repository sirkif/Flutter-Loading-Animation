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
      duration: Duration(
        seconds: 1,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 31), () {
      CircleFlipModel.circleFlipController.forward();
    });

    // => DELETE THIS
    Future.delayed(Duration(seconds: 38), () {
      CircleFlipModel.circleFlipController.stop();
    });

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
            offset: CircleFlipModel.secondBlueAnimation.value,
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
            offset: CircleFlipModel.firstRedAnimation.value,
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
            offset: CircleFlipModel.secondRedAnimation.value,
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
            offset: CircleFlipModel.firstBlueAnimation.value,
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
