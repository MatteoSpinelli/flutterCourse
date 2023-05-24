import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {key}) : super(key: key);

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 28,
      ),
    );
  }
}
