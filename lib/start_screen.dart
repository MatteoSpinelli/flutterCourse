import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
          ),
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(180, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            ),
            onPressed: () {},
            child: const Text(
              "Start Quiz",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(180, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}
