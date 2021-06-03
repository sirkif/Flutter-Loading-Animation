import 'package:flutter/material.dart';
import 'package:flutter_loading_animation/MontageVideo.dart';

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
        body: MontageVideo(),
      ),
    );
  }
}
