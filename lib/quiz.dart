// import 'dart:ui';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void quizRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartContainer(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = Questions(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswers, quizRestart);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
