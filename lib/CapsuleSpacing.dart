import 'package:flutter/material.dart';

class CapsuleSpacing extends StatefulWidget {
  @override
  _CapsuleSpacingState createState() => _CapsuleSpacingState();
}

class _CapsuleSpacingState extends State<CapsuleSpacing>
    with SingleTickerProviderStateMixin {
  late AnimationController capsuleSpacingController;
  late Animation<double> spacingAnimation;
  Tween<double> tween = Tween(begin: 5.0, end: 15.0);

  @override
  void initState() {
    super.initState();

    capsuleSpacingController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    spacingAnimation = tween.animate(CurvedAnimation(
        parent: capsuleSpacingController, curve: Curves.easeInOut));

    capsuleSpacingController.forward();

    capsuleSpacingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        capsuleSpacingController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    capsuleSpacingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /////// Green Capsule Shape
            CapsuleShape(
              height: 60,
              color: Color(0xFF06D6A0),
            ),

            /////// Spacing Animation
            CapsuleSpacingBuilder(
              widthAnimation: spacingAnimation,
              capsuleSpacingController: capsuleSpacingController,
            ),

            /////// Yellow Capsule Shape
            CapsuleShape(
              height: 40,
              color: Color(0xFFFFD166),
            ),

            /////// Spacing Animation
            CapsuleSpacingBuilder(
              widthAnimation: spacingAnimation,
              capsuleSpacingController: capsuleSpacingController,
            ),

            /////// Pink Capsule Shape
            CapsuleShape(
              height: 60,
              color: Color(0xFFEF476F),
            ),

            /////// Spacing Animation
            CapsuleSpacingBuilder(
              widthAnimation: spacingAnimation,
              capsuleSpacingController: capsuleSpacingController,
            ),

            /////// Yellow Capsule Shape
            CapsuleShape(
              height: 40,
              color: Color(0xFFFFD166),
            ),

            /////// Spacing Animation
            CapsuleSpacingBuilder(
              widthAnimation: spacingAnimation,
              capsuleSpacingController: capsuleSpacingController,
            ),

            /////// Green Capsule Shape
            CapsuleShape(
              height: 60,
              color: Color(0xFF06D6A0),
            )
          ],
        ),
      ),
    );
  }
}

/////// Loading Capsule Builder
class CapsuleSpacingBuilder extends StatelessWidget {
  final Animation<double> widthAnimation;
  final Listenable capsuleSpacingController;

  const CapsuleSpacingBuilder({
    required this.widthAnimation,
    required this.capsuleSpacingController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: capsuleSpacingController,
      builder: (context, child) => SizedBox(width: widthAnimation.value),
    );
  }
}

/////// Capsule Shape
class CapsuleShape extends StatelessWidget {
  final double height;
  final Color color;

  const CapsuleShape({
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
