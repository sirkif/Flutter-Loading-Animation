import 'package:flutter/material.dart';

import 'BoxRotationModel.dart';

class BoxRotation extends StatefulWidget {
  const BoxRotation({Key? key}) : super(key: key);

  @override
  _BoxRotationState createState() => _BoxRotationState();
}

class _BoxRotationState extends State<BoxRotation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    BoxRotationModel.boxRotationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 2), () {
      BoxRotationModel.boxRotationController.forward();
    });

    BoxRotationModel.boxRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        BoxRotationModel.boxRotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    BoxRotationModel.boxRotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: BoxRotationModel.boxRotationController,
        builder: (context, child) => Transform.rotate(
          angle: BoxRotationModel.firstRotateAnimation.value,
          child: Transform.rotate(
            angle: BoxRotationModel.secondRotateAnimation.value,
            child: Transform.rotate(
              angle: BoxRotationModel.thirdRotateAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 81,
                    height: 81,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF867AE9),
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  BoxRotationBuilder(
                    color: Color(0xFF00B8A9),
                    offset: BoxRotationModel.greenCubeAnimation,
                  ),
                  BoxRotationBuilder(
                    color: Color(0xFFFFCB77),
                    offset: BoxRotationModel.yellowCubeAnimation,
                  ),
                  BoxRotationBuilder(
                    color: Color(0xFFFE6D73),
                    offset: BoxRotationModel.orangeCubeAnimation,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////// Box Rotation Builder
class BoxRotationBuilder extends StatelessWidget {
  final Color color;
  final Animation<Offset> offset;

  const BoxRotationBuilder({
    required this.color,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: BoxRotationModel.boxRotationController,
      child: RoundedCubeShape(
        color: color,
      ),
      builder: (context, child) => Transform.translate(
        offset: offset.value,
        child: child,
      ),
    );
  }
}

/////// Rounded Cube Shape
class RoundedCubeShape extends StatelessWidget {
  final Color color;

  const RoundedCubeShape({
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
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
