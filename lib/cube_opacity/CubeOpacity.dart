import 'package:flutter/material.dart';

import 'CubeOpacityModel.dart';

class CubeOpacity extends StatefulWidget {
  const CubeOpacity({Key? key}) : super(key: key);

  @override
  _CubeOpacityState createState() => _CubeOpacityState();
}

class _CubeOpacityState extends State<CubeOpacity>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    CubeOpacityModel.rhombusSplitController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 2), () {
      CubeOpacityModel.rhombusSplitController.forward();
    });

    CubeOpacityModel.rhombusSplitController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CubeOpacityModel.rhombusSplitController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CubeOpacityModel.rhombusSplitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CubeOpacityBuilder(
            color: Color(0xFFFE6D73),
            offset: Offset(-18.0, -18.0),
            opacity: CubeOpacityModel.orangeAnimation,
          ),
          CubeOpacityBuilder(
            color: Color(0xFF867AE9),
            offset: Offset(18.0, -18.0),
            opacity: CubeOpacityModel.purpleAnimation,
          ),
          CubeOpacityBuilder(
            color: Color(0xFF00B8A9),
            offset: Offset(18.0, 18.0),
            opacity: CubeOpacityModel.greenAnimation,
          ),
          CubeOpacityBuilder(
            color: Color(0xFFFFCB77),
            offset: Offset(-18.0, 18.0),
            opacity: CubeOpacityModel.yellowAnimation,
          ),
        ],
      ),
    );
  }
}

/////// Cube Opacity Builder
class CubeOpacityBuilder extends StatelessWidget {
  final Color color;
  final Offset offset;
  final Animation<double> opacity;

  const CubeOpacityBuilder({
    required this.color,
    required this.offset,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CubeOpacityModel.rhombusSplitController,
      child: Transform.translate(
        offset: offset,
        child: CubeOpacityShape(
          color: color,
        ),
      ),
      builder: (context, child) => Opacity(
        opacity: opacity.value,
        child: child,
      ),
    );
  }
}

/////// Cube Opacity Shape
class CubeOpacityShape extends StatelessWidget {
  final Color color;

  const CubeOpacityShape({
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
