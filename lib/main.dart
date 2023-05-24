import 'package:app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 47, 14, 210),
          Color.fromARGB(255, 104, 126, 195),
        ),
      ),
    ),
  );
}
