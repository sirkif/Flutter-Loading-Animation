import 'package:flutter/material.dart';

import 'CircleOpacity.dart';

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
      home: CircleOpacity(),
    );
  }
}
