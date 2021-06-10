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
        milliseconds: 800,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 1), () {
      CircleFlipModel.circleFlipController.forward();
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
          CircleFlipBuilder(
            color: Color(0xFF0061A8),
            offset: CircleFlipModel.secondBlueAnimation,
            opacity: CircleFlipModel.secondOpacityAnimation,
          ),
          CircleFlipBuilder(
            color: Color(0xFFFF165D),
            offset: CircleFlipModel.firstRedAnimation,
            opacity: CircleFlipModel.firstOpacityAnimation,
          ),
          CircleFlipBuilder(
            color: Color(0xFFFF165D),
            offset: CircleFlipModel.secondRedAnimation,
            opacity: CircleFlipModel.secondOpacityAnimation,
          ),
          CircleFlipBuilder(
            color: Color(0xFF0061A8),
            offset: CircleFlipModel.firstBlueAnimation,
            opacity: CircleFlipModel.firstOpacityAnimation,
          ),
        ],
      ),
    );
  }
}

/////// Circle Flip Builder
class CircleFlipBuilder extends StatelessWidget {
  final Color color;
  final Animation<Offset> offset;
  final Animation<double> opacity;

  const CircleFlipBuilder({
    required this.color,
    required this.offset,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CircleFlipModel.circleFlipController,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      builder: (context, child) => Transform.translate(
        offset: offset.value,
        child: Opacity(
          opacity: opacity.value,
          child: child,
        ),
      ),
    );
  }
}
