// import 'package:adv_quiz/models/quiz_question.dart';
import 'package:adv_quiz/widget/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_quiz/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.selectedAns});
  final void Function(String answer) selectedAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  void changeIndex(String ans) {
    widget.selectedAns(ans);
    setState(() {
      currentQuestionIndex++;
      // if (currentQuestionIndex>questions.length|| currentQuestionIndex==questions.length) {
      //   currentQuestionIndex = 0;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswer().map(
                  (answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        changeIndex(answer);
                      }),
                )
          ]),
    );
  }
}
