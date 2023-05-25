import 'dart:ffi';

import 'package:app/answer_button.dart';
import 'package:app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chooseAnswer, {super.key});
  final void Function(String answer) chooseAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState(chooseAnswer);
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = 0;
  _QuestionScreenState(this.chooseAnswer);
  final void Function(String answer) chooseAnswer;

  void onTap() {
    setState(() {
      currentQuestion += 1;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion].text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 145, 138, 148),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...questions[currentQuestion].getShuffledAnswers().map(
                  (e) => AnswerButton(
                    e,
                    () {
                      onTap();
                      chooseAnswer(e);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
