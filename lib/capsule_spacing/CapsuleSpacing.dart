import 'package:flutter/material.dart';

import 'CapsuleSpacingModel.dart';

class CapsuleSpacing extends StatefulWidget {
  @override
  _CapsuleSpacingState createState() => _CapsuleSpacingState();
}

class _CapsuleSpacingState extends State<CapsuleSpacing>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    CapsuleSpacingModel.capsuleSpacingController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    // Delete Future To fire Animation immediately
    Future.delayed(Duration(seconds: 1), () {
      CapsuleSpacingModel.capsuleSpacingController.forward();
    });

    CapsuleSpacingModel.capsuleSpacingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CapsuleSpacingModel.capsuleSpacingController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CapsuleSpacingModel.capsuleSpacingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /////// Green Capsule Shape
          CapsuleSpacingShape(
            height: 50,
            color: Color(0xFF06D6A0),
          ),

          /////// Spacing Animation
          CapsuleSpacingBuilder(
            width: CapsuleSpacingModel.spacingAnimation,
          ),

          /////// Yellow Capsule Shape
          CapsuleSpacingShape(
            height: 30,
            color: Color(0xFFFFD166),
          ),

          /////// Spacing Animation
          CapsuleSpacingBuilder(
            width: CapsuleSpacingModel.spacingAnimation,
          ),

          /////// Pink Capsule Shape
          CapsuleSpacingShape(
            height: 50,
            color: Color(0xFFEF476F),
          ),

          /////// Spacing Animation
          CapsuleSpacingBuilder(
            width: CapsuleSpacingModel.spacingAnimation,
          ),

          /////// Yellow Capsule Shape
          CapsuleSpacingShape(
            height: 30,
            color: Color(0xFFFFD166),
          ),

          /////// Spacing Animation
          CapsuleSpacingBuilder(
            width: CapsuleSpacingModel.spacingAnimation,
          ),

          /////// Green Capsule Shape
          CapsuleSpacingShape(
            height: 50,
            color: Color(0xFF06D6A0),
          )
        ],
      ),
    );
  }
}

/////// Loading Capsule Builder
class CapsuleSpacingBuilder extends StatelessWidget {
  final Animation<double> width;

  const CapsuleSpacingBuilder({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CapsuleSpacingModel.capsuleSpacingController,
      builder: (context, child) => SizedBox(
        width: width.value,
      ),
    );
  }
}

/////// Capsule Shape
class CapsuleSpacingShape extends StatelessWidget {
  final double height;
  final Color color;

  const CapsuleSpacingShape({
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
