// import 'dart:math';

import 'package:adv_quiz/models/questions.dart';
import 'package:adv_quiz/questions_screen.dart';
import 'package:adv_quiz/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_quiz/starting_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-page';
  // Widget? activeScreen;
  @override
  // void initState() {
  //   activeScreen=  StartPage(onScreenChange);

  //   super.initState();   // -------------- Also can be used
  // }
  List<String> chooseAns = [];
  void answerDisplay(String ans) {
    chooseAns.add(ans);

    if (chooseAns.length == questions.length) {
      // chooseAns = [];

      setState(() {
        activeScreen = 'restart-page';
      });
    }
  }

  void onScreenChange() {
    setState(() {
      activeScreen = 'next-page';
      // chooseAns = [];
    });
  }

  void onScreenChangeRestart() {
    setState(() {
      activeScreen = 'next-page';
      chooseAns = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenShow = StartPage(onScreenChange);
    if (activeScreen == 'next-page') {
      screenShow = QuestionsScreen(
        selectedAns: answerDisplay,
      );
    }
    if (activeScreen == 'restart-page') {
      screenShow = ResultScreen(
        scrrenChangeToQuestion: onScreenChangeRestart,
        choosenStrings: chooseAns,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 83, 5, 218),
              Color.fromARGB(255, 95, 57, 160)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenShow,
        ),
      ),
    );
  }
}
