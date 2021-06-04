import 'package:flutter/material.dart';

// import 'capsule_spacing/CapsuleSpacing.dart';
// import 'circle_colors/CircleColors.dart';
// import 'circle_flip/CircleFlip.dart';
// import 'circle_gradual/CircleGradual.dart';
import 'circle_opacity/CircleOpacity.dart';
// import 'cube_offset/CubeOffset.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Loading Animation',
      home: Scaffold(
        backgroundColor: Colors.black,
        // body: CapsuleSpacing(),
        // body: CircleColors(),
        // body: CircleFlip(),
        // body: CircleGradual(),
        body: CircleOpacity(),
        // body: CubeOffset(),
      ),
    );
  }
}
