import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: data["user_answer"] == data["correct_answer"]
                            ? const Color.fromARGB(255, 35, 171, 85)
                            : const Color.fromARGB(255, 116, 58, 116),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20000),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: TextStyle(
                              color:
                                  data["user_answer"] == data["correct_answer"]
                                      ? const Color.fromARGB(255, 145, 138, 148)
                                      : const Color.fromARGB(255, 116, 58, 116),
                              fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: TextStyle(
                              color:
                                  data["user_answer"] == data["correct_answer"]
                                      ? const Color.fromARGB(255, 145, 138, 148)
                                      : const Color.fromARGB(255, 35, 171, 85),
                              fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
