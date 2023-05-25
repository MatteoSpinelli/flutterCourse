import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.changeScreen, {super.key});
  void Function() changeScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                fontSize: 28,
                color: const Color.fromARGB(180, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            onPressed: changeScreen,
            label: const Text(
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
