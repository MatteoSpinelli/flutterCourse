import 'package:app/data/questions.dart';
import 'package:app/question_screen.dart';
import 'package:app/result_screen.dart';
import 'package:app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? screen;
  List<String> selectedAnswers = [];
  _QuizState() {
    screen = StartScreen(changeScreen);
  }
  void changeScreen() {
    setState(() {
      screen = QuestionScreen(chooseAnswer);
    });
  }

  void resetQuiz() {
    setState(() {
      screen = StartScreen(changeScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = ResultScreen(selectedAnswers, resetQuiz);
      });
      selectedAnswers = [];
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 23, 0, 45),
                Color.fromARGB(255, 55, 0, 88),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
