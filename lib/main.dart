import 'package:flutter/material.dart';
import 'package:flutter_loading_animation/CircleGradual.dart';

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
        backgroundColor: Colors.black87,
        body: CircleGradual(),
      ),
    );
  }
}
